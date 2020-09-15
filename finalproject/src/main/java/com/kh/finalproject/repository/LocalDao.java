package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.LocalDto;

public interface LocalDao {
	//지역 등록
	void regist(String local_name);
	//지역 리스트
	List<LocalDto> getList();
	//지역 단일조회
	LocalDto get(String local_name);
	//지역 삭제
	void delete(int local_no);
}
