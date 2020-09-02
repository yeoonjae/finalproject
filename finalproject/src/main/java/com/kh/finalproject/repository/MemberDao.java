package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PointHisDto;

public interface MemberDao {

	List<MemberDto> getList();
	void plusPoint(PointHisDto pointHisDto);
	void minusPoint(PointHisDto pointHisDto);
}
