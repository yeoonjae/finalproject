package com.kh.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalproject.entity.CouponReqDto;
import com.kh.finalproject.repository.CouponReqDao;

@Service
public class CouponReqServiceImpl implements CouponReqService{

	@Autowired
	private CouponReqDao couponReqDao;

	// 쿠폰 요청 목록(지점)
	@Override
	public List<CouponReqDto> getList(int branch_no, String order) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("branch_no", branch_no);
		map.put("order", order);
		
		return couponReqDao.getList(map);
	}
	

	// 쿠폰 요청 목록(본사)
	@Override
	public List<CouponReqDto> getList2(int branch_no, String order) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("branch_no", branch_no);
		map.put("order", order);
		
		return couponReqDao.getList2(map);
	}
	
}
