package com.kh.finalproject.service;

public interface ScheduleService {

	// 쿠폰 보유현황 등록
	void regist();
	// 쿠폰 보유현황 삭제
	void delete();
	// 시작일이 지난 대기중인 요청 거절로 변경
	void changeState();
	// 쪽지 자동 삭제
	void messageAutoDelete();
}
