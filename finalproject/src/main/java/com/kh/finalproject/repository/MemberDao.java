package com.kh.finalproject.repository;

import java.util.List;
import java.util.Map;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PointHisDto;

public interface MemberDao {

	// 전체 회원 목록 조회
	List<MemberDto> getList();
	
	// 지점별 회원 목록 조회
	List<MemberDto> getList(int branch_no);
	
	// 회원 단일조회
	MemberDto get(int member_no);
	
	// 회원 마일리지 적립
	void plusPoint(PointHisDto pointHisDto);
	
	// 회원 마일리지 차감 
	void minusPoint(PointHisDto pointHisDto);
	
	// 회원 검색
	List<MemberDto> search(Map<String, Object> param);
}
