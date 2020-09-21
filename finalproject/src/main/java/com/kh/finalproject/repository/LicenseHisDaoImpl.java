package com.kh.finalproject.repository;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.LicenseHisDto;
import com.kh.finalproject.entity.PayServeDto;

@Repository
public class LicenseHisDaoImpl implements LicenseHisDao{

	@Autowired
	private SqlSession sqlSession;
	
	// 이용 내역 등록
	@Override
	public void registStart(LicenseHisDto licenseHisDto) {
		sqlSession.insert("licenseHis.regist", licenseHisDto);
		
	}

	// 종료시간 업데이트
	@Override
	public void updateFinish(int license_his_no) {
		sqlSession.update("licenseHis.updateFinish", license_his_no);
		
	}

	// 이용중인지 확인
	@Override
	public LicenseHisDto getUsed(int member_no) {
		return sqlSession.selectOne("licenseHis.getUsed", member_no);
	}

	// 이용시간 조회
	@Override
	public int useTime(int license_his_no) {
		return sqlSession.selectOne("licenseHis.useTime", license_his_no);
	}

	// 결제 금액 업데이트
	@Override
	public void updatePay(Map<String, Object> param) {
		sqlSession.update("licenseHis.updatePay", param);
	}

	// 결제 추가정보 가져오기
	@Override
	public PayServeDto getPayInfo(int license_his_no) {
		return sqlSession.selectOne("licenseHis.payInfo", license_his_no);
	}


}
