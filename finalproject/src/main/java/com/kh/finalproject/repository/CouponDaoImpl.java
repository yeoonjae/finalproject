package com.kh.finalproject.repository;

import java.util.List;
import java.util.Map;

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
	// 쿠폰 목록 조회
	@Override
	public List<CouponDto> getList(Map<String, Object> param) {
		return sqlSession.selectList("coupon.getList", param);
	}
	// 쿠폰 그룹번호 추출
	@Override
	public int getGroupSeq() {
		return sqlSession.selectOne("coupon.getGroupSeq");
	}
	// 쿠폰 삭제
	@Override
	public void delete(int coupon_no) {
		sqlSession.delete("coupon.delete", coupon_no);
		
	}
	

}
