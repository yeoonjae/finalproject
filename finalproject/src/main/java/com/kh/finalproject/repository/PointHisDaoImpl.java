package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.PointHisDto;

@Repository
public class PointHisDaoImpl implements PointHisDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getSeq() {
		return sqlSession.selectOne("pointHis.getSeq");
	}	
	
	@Override
	public void regist(PointHisDto pointHisDto) {
		sqlSession.insert("pointHis.regist", pointHisDto);
	}
	

	
	
}
