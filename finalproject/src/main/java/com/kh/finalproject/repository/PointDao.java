package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.PointDto;

public interface PointDao {

	void regist(PointDto pointDto);
	List<PointDto> getList();
	List<PointDto> getList(String point_type);
	PointDto get(int point_no);
	void edit(PointDto pointDto);
	void delete(int point_no);
}
