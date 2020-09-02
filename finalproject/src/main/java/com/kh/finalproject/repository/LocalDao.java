package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.LocalDto;

public interface LocalDao {
	void regist(String local_name);
	List<LocalDto> getList();
	LocalDto get(String local_name);
}
