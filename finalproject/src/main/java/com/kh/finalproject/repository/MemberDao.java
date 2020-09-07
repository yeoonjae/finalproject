package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PointHisDto;

public interface MemberDao {

	List<MemberDto> getList();
	void plusPoint(PointHisDto pointHisDto);
	void minusPoint(PointHisDto pointHisDto);
	MemberDto get(int member_no);
	
	void delete(int member_no);
	
	void changePw(String pw);
	int edit(MemberDto memberDto);
	void join(MemberDto memberDto);
	boolean login(String member_email, String member_pw);
	int getNo(String member_email);
	void updateLoginTime(int member_no);
	int getSeq();
	String getId(String member_name);
}
