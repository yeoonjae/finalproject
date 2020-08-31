package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.LicenseDto;

public interface LicenseDao {
	public void regist(LicenseDto licenseDto);
	public List<LicenseDto> getList();
	public void delete(int license_no);
}
