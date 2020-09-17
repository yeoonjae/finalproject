package com.kh.finalproject.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.CouponReqDto;

@Repository
public class CouponReqDaoImpl implements CouponReqDao{

	@Autowired
	private SqlSession sqlSession;
	
	// 쿠폰 요청 목록 (지점)
	@Override
	public List<CouponReqDto> getList(Map<String,Object> map) {
		return sqlSession.selectList("couponReq.getList", map);
	}
	// 쿠폰 요청 목록 (본사)
	@Override
	public List<CouponReqDto> getList2(Map<String,Object> map) {
		return sqlSession.selectList("couponReq.getList2", map);
	}
	
	// 쿠폰 요청 등록 
	@Override
	public void regist(CouponReqDto couponReqDto) {
		sqlSession.insert("couponReq.regist", couponReqDto);
	}
	
	// 지점 요청 대기 목록
	@Override
	public List<CouponReqDto> waitList(int branch_no) {
		return sqlSession.selectList("couponReq.waitList", branch_no);
	}
	// 요청 정보 수정
	@Override
	public void edit(CouponReqDto couponReqDto) {
		sqlSession.update("couponReq.edit", couponReqDto);
	}
	// 단일 조회
	@Override
	public CouponReqDto get(int coupon_req_no) {
		return sqlSession.selectOne("couponReq.get", coupon_req_no);
	}
	
	// 1) 시작일이 내일인 대기중인 쿠폰 요청 조회
	@Override
	public List<Integer> changeStateList() {
		return sqlSession.selectList("couponReq.changeStateList");
	}
	
	// 2) 해당 쿠폰 '거절'로 변경
	@Override
	public void changeState(int coupon_req_no) {
		sqlSession.update("couponReq.changeState", coupon_req_no);
		
	}

}
