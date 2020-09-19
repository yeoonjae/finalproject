package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.InoutDto;

@Repository
public class InoutDaoImpl implements InoutDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void registIn(InoutDto inoutDto) {
		sqlSession.insert("inout.registIn", inoutDto);		
	}

	@Override
	public void registOut(InoutDto inoutDto) {
		sqlSession.insert("inout.registOut", inoutDto);		
	}
	
}
