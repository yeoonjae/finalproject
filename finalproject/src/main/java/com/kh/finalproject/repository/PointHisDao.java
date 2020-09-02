package com.kh.finalproject.repository;

import com.kh.finalproject.entity.PointHisDto;

public interface PointHisDao {

	int getSeq();
	void regist(PointHisDto pointHisDto);
}
