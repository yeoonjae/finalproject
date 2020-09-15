package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.CertDto;
@Repository
public class CertDaoImpl implements CertDao {
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void insert(CertDto certDto) {
		sqlSession.insert("cert.regist", certDto);
	}

	@Override
	public boolean validate(CertDto certDto) {
		CertDto result = sqlSession.selectOne("cert.validate", certDto);
		if(result != null) {
			sqlSession.delete("cert.remove", result);			
		}
		return result != null;
//		if(result != null) {
//			return true;
//		}
//		else {
//			return false;
//		}
	}

	@Override
	public void clearAll() {
		sqlSession.delete("cert.clear");
	}
}
