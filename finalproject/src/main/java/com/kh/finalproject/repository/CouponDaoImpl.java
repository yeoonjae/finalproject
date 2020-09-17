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
	public List<CouponDto> getList(String order) {
		return sqlSession.selectList("coupon.getListA", order);
	}
	public List<CouponDto> getList(Map<String, Object> param) {
		return sqlSession.selectList("coupon.getListB", param);
	}
	// 쿠폰 그룹번호 추출
	@Override
	public int getGroupSeq() {
		return sqlSession.selectOne("coupon.getGroupSeq");
	}
	// 쿠폰 삭제
	@Override
	public void delete(int group_no) {
		sqlSession.delete("coupon.delete", group_no);
		
	}
	// 그룹번호 일치하는 지점번호 조회
	@Override
	public List<CouponDto> getCouponList(String order) {
		return sqlSession.selectList("coupon.getCouponList", order);
	}
	
	// 시작일이 오늘인 쿠폰 조회
	@Override
	public List<CouponDto> todayStart() {
		return sqlSession.selectList("coupon.todayStart");
	}

	// 종료일이 오늘인 쿠폰 조회
	@Override
	public List<CouponDto> todayFinish() {
		return sqlSession.selectList("coupon.todayFinish");
	}

}
