package com.kh.finalproject.service;

import java.util.List;
import java.util.Map;

import com.kh.finalproject.entity.CouponDto;

public interface CouponService {
	// 쿠폰 등록
	void regist(int[] branch_no, int[] local_no, CouponDto couponDto);
	// 전체 대상 쿠폰 목록
	List<CouponDto> getList(String order);
	// 지점 대상 쿠폰 목록
	List<CouponDto> getList(int branch_no, String order);
	
	
}
