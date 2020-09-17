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
}
