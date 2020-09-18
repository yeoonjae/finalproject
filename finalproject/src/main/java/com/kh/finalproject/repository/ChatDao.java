package com.kh.finalproject.repository;

import java.util.List;


import com.kh.finalproject.entity.ChatDto;

public interface ChatDao {

	void regist(ChatDto chatDto);
	List<ChatDto> getList(String chat_type);
	List<ChatDto> getList();
	
	List<ChatDto> getList(int type_no);
	
	List<ChatDto> getDetailList(int chat_no); 
}
