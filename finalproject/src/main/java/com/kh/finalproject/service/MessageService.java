package com.kh.finalproject.service;

import com.kh.finalproject.VO.MessageVO;
import com.kh.finalproject.entity.AdminDto;

public interface MessageService {

	//메세지 등록
	void regist(MessageVO messageVO, AdminDto adminDto);
	
	//메세지 삭제(발신함)
	void deleteOutbox(int message_manager_no);
	
	//메세지 삭제(수신함)
	void deleteInbox(int message_manager_no);

	//메세지 삭제(회원 수신함)
	void deleteInboxMemeber(int message_member_no);
}
