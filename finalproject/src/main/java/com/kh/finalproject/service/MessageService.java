package com.kh.finalproject.service;

import java.util.List;

import com.kh.finalproject.VO.MessageVO;
import com.kh.finalproject.VO.PagingVO;
import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.MessageManagerDto;
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
	
	//(회원)페이징 처리를 위한 메세지 개수
	int countMessage(int member_no);
	
	//(회원)수신함 + 페이징
	List<MessageMemberDto> inboxMember(int member_no, PagingVO pagingVO);
	
	//(지점 관리자)발신함 메세지 개수
	int outboxCountBranchManager(int admin_no);
	
	//(지점 관리자)발신함 + 페이징
	List<MessageMemberDto> outboxBranchManager(int admin_no, PagingVO pagingVO);
	
	//(지점,본사관리자)수신함 메세지 개수
	int inboxCountManager(int admin_no);
	
	//(지점,본사관리자)수신함 + 페이징
	List<MessageManagerDto> inboxManager(int admin_no,PagingVO pagingVO);
	
	//(본사 관리자)발신함 메세지 개수
	int outboxCountTotalManager(int admin_no);
	
	//(본사 관리자)발신함 + 페이징
	List<MessageMemberDto> outboxTotalManager(int admin_no, PagingVO pagingVO);
	
}
