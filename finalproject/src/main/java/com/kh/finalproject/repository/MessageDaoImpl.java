package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MessageManagerDto;

@Repository
public class MessageDaoImpl implements MessageDao{

	@Autowired
	private SqlSession sqlSession;

	//메세지 수신함(관리자 로그인)
	public List<MessageManagerDto> inbox(int admin_no) {
		return sqlSession.selectList("message.inboxAdmin", admin_no);
	}

	//메세지 발신함(관리자 로그인)
	public List<MessageManagerDto> outbox(int admin_no) {
		return sqlSession.selectList("message.outboxAdmin",admin_no);
	}

	//메세지 삭제
	public void delete(int message_manager_no) {
		sqlSession.delete("message.manager_delete", message_manager_no);
		
	}
	
	
	

}
