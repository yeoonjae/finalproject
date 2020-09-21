package com.kh.finalproject.repository;

import java.util.List;
import java.util.Map;

import com.kh.finalproject.entity.SeatDto;

public interface SeatDao {

	// 좌석 등록
	void regist(SeatDto seatDto);
	// 출입구 위치 등록
	void regist(Map<String, Object> map);
	// 지점별 좌석 정보
	List<SeatDto> getList(int branch_no);
	// 지점별 좌석 row 최대값
	int getRow(int branch_no);
	// 지점별 좌석 col 최대값
	int getCol(int branch_no);
	// 출입구 위치 가져오기
	String getEntrance(int branch_no);
	// 좌석 이용 가능으로 수정
	void notUsed(int seat_no);
	// 좌석 이용 불가로 수정
	void used(int seat_no);
	// 좌석 등록여부 조회
	int checkRegist(int branch_no);
	// 이용가능한 좌석 개수 조회
	int getUseCount(int branch_no);
	// 전체 좌석 개수 조회
	int getAllCount(int branch_no);
	// 좌석 삭제
	void delete(int branch_no);
}
