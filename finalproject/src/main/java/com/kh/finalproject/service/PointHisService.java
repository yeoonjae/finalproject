package com.kh.finalproject.service;

import java.util.List;

import com.kh.finalproject.entity.PointHisDto;

public interface PointHisService {
	void regist(PointHisDto pointHisDto);
	List<PointHisDto> getList(int member_no, String start, String finish);
}
