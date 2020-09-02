package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.LocalDto;

@Repository
public class LocalDaoImpl implements LocalDao{

	@Autowired
	private SqlSession sqlSession;
	
	//지역 등록 메소드
	public void regist(String local_name) {
		sqlSession.insert("local.regist", local_name);
	}

	//지역 리스트 
	public List<LocalDto> getList() {
		List<LocalDto> list = sqlSession.selectList("local.getList");
		return list;
	}
	
	//지역 검색
	public LocalDto get(String local_name) {
		LocalDto localDto = sqlSession.selectOne("local.get", local_name);
		return localDto;
	}
}
