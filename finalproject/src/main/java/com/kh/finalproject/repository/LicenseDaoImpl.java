package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.LicenseDto;

@Repository
public class LicenseDaoImpl implements LicenseDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	// 이용권 등록
	@Override
	public void regist(LicenseDto licenseDto) {
		sqlSession.insert("license.license_regist",licenseDto);
	}

	//이용권 목록
	@Override
	public List<LicenseDto> getList() {
		return sqlSession.selectList("license.license_getList");
	}

	@Override
	public void delete(int license_no) {
		sqlSession.delete("license.license_delete",license_no);
	}
	

}
