package com.kh.finalproject.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PointHisDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	// 전체 회원 목록 
	@Override
	public List<MemberDto> getList() {
		return sqlSession.selectList("member.getList");
	}
	
	// 회원 마일리지 적립
	@Override
	public void plusPoint(PointHisDto pointHisDto) {
		sqlSession.update("member.plusPoint", pointHisDto);
	}
	
	// 회원 마일리지 차감
	@Override
	public void minusPoint(PointHisDto pointHisDto) {
		sqlSession.update("member.minusPoint", pointHisDto);		
	}

	// 지점별 회원 목록
	@Override
	public List<MemberDto> getList(int branch_no) {
		return sqlSession.selectList("member.getList2", branch_no);
	}

	// 회원 검색
	@Override
	public List<MemberDto> search(Map<String, Object> param) {
		return sqlSession.selectList("member.search", param);
	}
		
}