package com.kh.finalproject.service;

import com.kh.finalproject.VO.MessageVO;
import com.kh.finalproject.entity.AdminDto;

public interface MessageService {

	//메세지 등록
	void regist(MessageVO messageVO, AdminDto adminDto);
}
