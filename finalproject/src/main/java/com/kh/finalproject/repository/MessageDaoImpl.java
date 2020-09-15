package com.kh.finalproject.repository;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.MessageManagerDto;
import com.kh.finalproject.entity.MessageMemberDto;

@Repository
public class MessageDaoImpl implements MessageDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private HttpSession session;

	//메세지 수신함(관리자 로그인)
	public List<MessageManagerDto> inbox(int admin_no) {
		return sqlSession.selectList("message.inboxAdmin", admin_no);
	}

	//메세지 발신함(본사관리자 로그인)
	public List<MessageManagerDto> outboxManager(int admin_no) {
		return sqlSession.selectList("message.outboxAdmin",admin_no);
	}

	//메세지 발신함(지점관리자 로그인)
	public List<MessageMemberDto> outboxBranchManager(int admin_no) {
		return sqlSession.selectList("message.outboxManager", admin_no);
	}
	
	//메세지 삭제
	public void delete(int message_manager_no) {
		sqlSession.delete("message.managerDelete", message_manager_no);
	}

	//메세지 수신함(회원 로그인)
	public List<MessageMemberDto> inboxMember(int member_no) {
		List<MessageMemberDto> list = sqlSession.selectList("message.inboxMember", member_no);
		return list;
	}

}
