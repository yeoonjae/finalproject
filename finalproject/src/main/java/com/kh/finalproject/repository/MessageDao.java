package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.MessageManagerDto;

public interface MessageDao {
	//메세지 수신함(관리자 로그인)
	 List<MessageManagerDto> inbox(int admin_no);
	//메세지 발신함(관리자 로그인)
	 List<MessageManagerDto> outbox(int admin_no);
	//메세지 삭제
	void delete(int message_manager_no);
}

