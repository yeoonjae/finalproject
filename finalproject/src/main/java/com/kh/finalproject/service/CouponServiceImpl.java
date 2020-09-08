package com.kh.finalproject.service;

import java.util.List;

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
		
		if(branch_no[0]==0 && local_no[0]==0) { // 전체 지점일 경우
			// 전체 지점번호 가져오기
			List<Integer> list = branchDao.getNo();
			
			// 전체지점 쿠폰 등록
			for(int i=0; i<list.size(); i++) {
				couponDto.setBranch_no(list.get(i));
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
						couponDto.setBranch_no(list.get(j));
						couponDao.registB(couponDto);
					}
				}
			}
			
			if(branch_no[0]!=0) { // 지점이 선택된 경우
				// 선택된 지점 개수만큼 등록
				for(int i=0; i<branch_no.length; i++) {
					couponDto.setBranch_no(branch_no[i]);
					couponDao.registB(couponDto);
				}
			}
		}
		
	}
	

}
