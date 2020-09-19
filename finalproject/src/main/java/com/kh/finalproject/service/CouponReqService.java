package com.kh.finalproject.service;

import java.util.List;

import com.kh.finalproject.entity.CouponReqDto;

public interface CouponReqService {

	// 쿠폰 요청 목록(지점)
	List<CouponReqDto> getList(int branch_no, String order);

	// 쿠폰 요청 목록(본사)
	List<CouponReqDto> getList2(int branch_no, String order);
}
