package com.kh.finalproject.repository;

import com.kh.finalproject.entity.LicenseHisDto;

public interface LicenseHisDao {

	void regist(LicenseHisDto licenseHisDto);
	
	// 현재 이용중인지 확인
	LicenseHisDto getUsed(int member_no);
}
