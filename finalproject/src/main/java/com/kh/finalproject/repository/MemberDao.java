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
	
	// 회원 시간 조회 
	int getCharge(int member_no);
	
	// 회원 검색
	List<MemberDto> search(Map<String, Object> param);
	
	// 충전시간 수정
	void changeCharge(Map<String, Object> param);
	
	void delete(int member_no);
	
	int edit(MemberDto memberDto);
	void join(MemberDto memberDto);
	boolean login(String member_email, String member_pw);
	int getNo(String member_email);
	void updateLoginTime(int member_no);
	int getSeq();
	List<String> getId(String member_name);

	void changePw(int no, String member_pw);

	Object overlap(String member_email);

}
