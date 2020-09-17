package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MemberCouponDto;

@Repository
public class MemberCouponDaoImpl implements MemberCouponDao{

	@Autowired
	private SqlSession sqlSession;
	
	// 쿠폰 내역 등록
	@Override
	public void regist(MemberCouponDto memberCouponDto) {
		sqlSession.insert("memberCoupon.regist", memberCouponDto);
		
	}

	// 쿠폰 내역 삭제
	@Override
	public void delete(int coupon_no) {
		sqlSession.delete("memberCoupon.delete", coupon_no);
	}

}
