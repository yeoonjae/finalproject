package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.LicenseHisDto;

@Repository
public class LicenseHisDaoImpl implements LicenseHisDao{

	@Autowired
	private SqlSession sqlSession;
	
	// 이용 내역 등록
	@Override
	public void regist(LicenseHisDto licenseHisDto) {
		sqlSession.insert("licenseHis.regist", licenseHisDto);
		
	}

	@Override
	public LicenseHisDto getUsed(int member_no) {
		return sqlSession.selectOne("licenseHis.getUsed", member_no);
	}

}
