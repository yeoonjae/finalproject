package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.SeatDto;

@Repository
public class SeatDaoImpl implements SeatDao{

	@Autowired
	private SqlSession sqlSession;
	
	// 좌석 등록
	@Override
	public void regist(SeatDto seatDto) {
		sqlSession.insert("seat.regist", seatDto);
		
	}

	// 좌석 정보
	@Override
	public List<SeatDto> getList(int branch_no) {
		return sqlSession.selectList("seat.getList", branch_no);
	}

	// row 최대값
	@Override
	public int getRow(int branch_no) {
		return sqlSession.selectOne("seat.getRow", branch_no);
	}

	// col 최대값
	@Override
	public int getCol(int branch_no) {
		return sqlSession.selectOne("seat.getCol", branch_no);
	}

}
