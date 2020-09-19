package com.kh.finalproject.repository;

import java.util.List;
import java.util.Map;

import com.kh.finalproject.entity.CouponDto;

public interface CouponDao {
	
	// 전체 쿠폰 등록
	void registA(CouponDto couponDto);
	// 지점 쿠폰 등록
	void registB(CouponDto couponDto);
	// 쿠폰 목록 조회
	List<CouponDto> getList(String order);
	List<CouponDto> getList(Map<String, Object> param);
	List<CouponDto> getCouponList(String order);
	// 쿠폰 그룹번호 추출
	int getGroupSeq();
	// 쿠폰 삭제
	void delete(int group_no);
	// 시작일이 오늘인 쿠폰 조회
	List<CouponDto> todayStart();
	// 종료일이 오늘인 쿠폰 조회
	List<CouponDto> todayFinish();

}
