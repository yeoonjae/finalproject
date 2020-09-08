package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.CouponDto;
import com.kh.finalproject.service.CouponService;

@Repository
public class CouponDaoImpl implements CouponDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 전체 쿠폰 등록
	@Override
	public void registA(CouponDto couponDto) {
		sqlSession.insert("coupon.registA", couponDto);
		
	}
	// 지점 쿠폰 등록
	@Override
	public void registB(CouponDto couponDto) {
		sqlSession.insert("coupon.registB", couponDto);		
		
	}

}
