package com.kh.finalproject.repository;

import com.kh.finalproject.entity.CouponDto;

public interface CouponDao {
	
	// 전체 쿠폰 등록
	void registA(CouponDto couponDto);
	// 지점 쿠폰 등록
	void registB(CouponDto couponDto);
}
