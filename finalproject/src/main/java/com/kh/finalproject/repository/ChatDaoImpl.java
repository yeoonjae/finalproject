package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.ChatDto;

@Repository
public class ChatDaoImpl implements ChatDao{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void regist(ChatDto chatDto) {
		sqlSession.insert("chat.regist",chatDto);
	}

	@Override
	public List<ChatDto> getList(String chat_type) {
		return sqlSession.selectList("chat.getList2",chat_type);
	}
	
	public List<ChatDto> getList() {
		return sqlSession.selectList("chat.getList");
	}

	@Override
	public List<ChatDto> getList(int type_no) {
		return sqlSession.selectList("chat.getList3",type_no);
	}

	@Override
	public List<ChatDto> getDetailList(int chat_no) {
		return sqlSession.selectList("chat.getList4",chat_no);
	}

	// 챗봇 데이터 삭제 
	@Override
	public void delete(int chat_no) {
		sqlSession.delete("chat.delete",chat_no);
	}

}
