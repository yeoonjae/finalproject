package com.kh.finalproject.repository;

import com.kh.finalproject.entity.InoutDto;

public interface InoutDao {

	void registIn(InoutDto inoutDto);
	void registOut(InoutDto inoutDto);
}
