package com.kh.finalproject.repository;

import java.util.List;

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

	@Override
	public List<PointDto> getList(String point_type) {
		return sqlSession.selectList("point.getList2", point_type);
	}

	@Override
	public List<PointDto> getList() {
		return sqlSession.selectList("point.getList");
	}

	@Override
	public PointDto get(int point_no) {
		return sqlSession.selectOne("point.get", point_no);
	}

	@Override
	public void edit(PointDto pointDto) {
		sqlSession.update("point.edit", pointDto);
		
	}

	@Override
	public void delete(int point_no) {
		sqlSession.delete("point.delete", point_no);
		
	}

}
