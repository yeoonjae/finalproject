package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LocalDaoImpl implements LocalDao{

	@Autowired
	private SqlSession sqlSession;
	
	//지역 등록 메소드
	public void regist(String local_name) {
		sqlSession.insert("local.regist", local_name);
	}
}
