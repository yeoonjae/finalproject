package com.kh.finalproject.repository;

import java.util.List;
import java.util.Map;

import com.kh.finalproject.entity.CouponReqDto;

public interface CouponReqDao {
	
	// 쿠폰 요청 등록
	void regist(CouponReqDto couponReqDto);	
	// 쿠폰 요청 목록(지점)
	List<CouponReqDto> getList(Map<String, Object> map);
	// 쿠폰 요청 목록(본사)
	List<CouponReqDto> getList2(Map<String, Object> map);
	// 지점 요청 대기 목록
	List<CouponReqDto> waitList(int branch_no);
	// 요청 수정
	void edit(CouponReqDto couponReqDto);
	// 단일 조회
	CouponReqDto get(int coupon_req_no);
	// 1) 시작일이 내일인 대기중인 쿠폰요청 조회
	List<Integer> changeStateList();
	// 2) 해당 쿠폰 '거절'로 변경
	void changeState(int coupon_req_no);

}
