package com.kh.finalproject.service;

import java.util.List;

import com.kh.finalproject.VO.MessageVO;
import com.kh.finalproject.VO.PagingMessageVO;
import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.MessageMemberDto;

public interface MessageService {

	//메세지 등록
	void regist(MessageVO messageVO, AdminDto adminDto);
	
	//메세지 삭제(발신함)
	void deleteOutbox(int message_manager_no);
	
	//메세지 삭제(수신함)
	void deleteInbox(int message_manager_no);

	//메세지 삭제(회원 수신함)
	void deleteInboxMemeber(int message_member_no);
	
	//페이징 처리를 위한 메세지 개수
	int countMessage(int member_no);
	
	//메세지 수신함(회원 로그인) + 페이징
	List<MessageMemberDto> inboxMember(int member_no, PagingMessageVO pagingVO);
}
