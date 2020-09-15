package com.kh.finalproject.repository;

import java.util.List;
import java.util.Map;

import com.kh.finalproject.entity.PointHisDto;

public interface PointHisDao {

	int getSeq();
	void regist(PointHisDto pointHisDto);
	List<PointHisDto> getList(Map<String, Object> param);
}
