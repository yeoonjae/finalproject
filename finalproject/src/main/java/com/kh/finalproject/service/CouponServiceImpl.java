package com.kh.finalproject.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalproject.entity.CouponDto;
import com.kh.finalproject.repository.BranchDao;
import com.kh.finalproject.repository.CouponDao;

@Service
public class CouponServiceImpl implements CouponService{

	@Autowired
	private CouponDao couponDao;
	
	@Autowired
	private BranchDao branchDao;
	
	@Override
	public void regist(int[] branch_no, int[] local_no, CouponDto couponDto) {
		int group_no = couponDao.getGroupSeq();
		
		if(branch_no[0]==0 && local_no[0]==0) { // 전체 지점일 경우
			// 전체 지점번호 가져오기
			List<Integer> list = branchDao.getNo();
			
			// 전체지점 쿠폰 등록
			for(int i=0; i<list.size(); i++) {
				couponDto.setBranch_no(list.get(i));
				couponDto.setGroup_no(group_no);
				couponDao.registA(couponDto);
			}
			
		} else { // 지점 또는 지역 발급일 경우
			
			if(local_no[0]!=0) { // 지역이 선택된 경우
				// 선택된 지역 개수만큼 등록
				for(int i=0; i<local_no.length; i++) {
					// 지역에 해당하는 지점번호 가져오기
					List<Integer> list = branchDao.getNo2(local_no[i]);
					// 지점 개수만큼 등록
					for(int j=0; j<list.size(); j++) {
						couponDto.setGroup_no(group_no);
						couponDto.setBranch_no(list.get(j));
						couponDao.registB(couponDto);
					}
				}
			}
			
			if(branch_no[0]!=0) { // 지점이 선택된 경우
				// 선택된 지점 개수만큼 등록
				for(int i=0; i<branch_no.length; i++) {
					couponDto.setGroup_no(group_no);
					couponDto.setBranch_no(branch_no[i]);
					couponDao.registB(couponDto);
				}
			}
		}
		
	}

	// 전체 대상 쿠폰 목록
	@Override
	public List<CouponDto> getList(String order) {
		
		return couponDao.getList(order);
	}
	// 지점대상 쿠폰 목록
	@Override
	public List<CouponDto> getList(int branch_no, String order) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("branch_no", branch_no);
		param.put("order", order);
		
		return couponDao.getList(param);
	}
	

}
