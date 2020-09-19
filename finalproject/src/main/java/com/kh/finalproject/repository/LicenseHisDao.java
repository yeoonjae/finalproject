package com.kh.finalproject.repository;

import java.util.Map;

import com.kh.finalproject.entity.LicenseHisDto;
import com.kh.finalproject.entity.PayServeDto;

public interface LicenseHisDao {

	// 시작시간 등록
	void registStart(LicenseHisDto licenseHisDto);
	// 종료시간 등록
	void updateFinish(int license_his_no);
	// 현재 이용중인지 확인
	LicenseHisDto getUsed(int member_no);
	// 이용 시간 확인
	int useTime(int license_his_no);
	// 결제 금액 업데이트
	void updatePay(Map<String, Object> param);
	// 결제 추가정보
	PayServeDto getPayInfo(int license_his_no);
}
