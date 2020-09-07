package com.kh.finalproject.repository;

import com.kh.finalproject.entity.CertDto;

public interface CertDao {

	void insert(CertDto certDto);

	boolean validate(CertDto build);

	void clearAll();

}
