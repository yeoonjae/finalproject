package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.PointDto;

@Repository
public class PointDaoImpl implements PointDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void regist(PointDto pointDto) {
		int point_no = sqlSession.selectOne("point.getSeq");
		pointDto.setPoint_no(point_no);
		sqlSession.insert("point.regist", pointDto);
	}

}
