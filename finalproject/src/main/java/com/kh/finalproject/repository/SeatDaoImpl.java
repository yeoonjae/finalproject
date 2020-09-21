package com.kh.finalproject.repository;

import java.util.List;
import java.util.Map;

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

	// 출입구 위치 등록
	@Override
	public void regist(Map<String, Object> map) {
		sqlSession.insert("seat.entrance", map);
	}

	// 출입구 위치 가져오기
	@Override
	public String getEntrance(int branch_no) {
		return sqlSession.selectOne("seat.getEntrance", branch_no);
	}

	// 이용 가능으로 수정
	@Override
	public void notUsed(int seat_no) {
		sqlSession.update("seat.notUsed", seat_no);
	}

	// 이용 불가로 수정
	@Override
	public void used(int seat_no) {
		sqlSession.update("seat.used", seat_no);
	}

	// 좌석 등록여부 조회
	@Override
	public int checkRegist(int branch_no) {
		return sqlSession.selectOne("seat.checkRegist", branch_no);
	}

	// 이용 가능한 좌석 개수 조회
	@Override
	public int getUseCount(int branch_no) {
		return sqlSession.selectOne("seat.getUseCount", branch_no);
	}

	// 전체 좌석 개수 조회
	@Override
	public int getAllCount(int branch_no) {
		return sqlSession.selectOne("seat.getAllCount", branch_no);
	}

	@Override
	public void delete(int branch_no) {
		sqlSession.delete("seat.delete", branch_no);
		sqlSession.delete("seat.entranceDelete", branch_no);
		
	}

}
