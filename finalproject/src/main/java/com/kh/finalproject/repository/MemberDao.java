package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PointHisDto;

public interface MemberDao {

	List<MemberDto> getList();
	void plusPoint(PointHisDto pointHisDto);
	void minusPoint(PointHisDto pointHisDto);
	MemberDto get(int no);
	
	void delete(int no);
	int edit(MemberDto memberDto);
	void join(MemberDto memberDto);
	boolean login(String id, String pw);
	int getNo(String id);
	void updateLoginTime(int no);
}
