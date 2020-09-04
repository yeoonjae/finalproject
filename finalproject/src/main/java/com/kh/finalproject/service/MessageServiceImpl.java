package com.kh.finalproject.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalproject.VO.MessageVO;
import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.MessageDto;
import com.kh.finalproject.entity.MessageManagerDto;
import com.kh.finalproject.entity.MessageMemberDto;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private SqlSession sqlSession;


	//메세지 등록
	public void regist(MessageVO messageVO) {
		MessageDto messageDto = new MessageDto();
		int message_no = sqlSession.selectOne("message.getSeq");
		messageDto.setMessage_no(message_no);
		messageDto.setMessage_title(messageVO.getMessage_title());
		messageDto.setMessage_content(messageVO.getMessage_content());
		sqlSession.insert("message.regist", messageDto);
		int sender_no = sqlSession.selectOne("admin.getAdminNO",messageVO.getSender_name());
		String[] receiver = messageVO.getReceiver_name();
		if(receiver.length < 2 && receiver[0].equals("전체 지점장")) {
			List<AdminDto> list = sqlSession.selectList("admin.getBranchAdmin");
			for(int i=0;i<list.size();i++) {
				//지점장들(주인공) 수신으로 받기
				MessageManagerDto managerDto2 = new MessageManagerDto();
				managerDto2.setMessage_no(message_no);//쪽지 번호 저장
				managerDto2.setAdmin_no(list.get(i).getAdmin_no());
				managerDto2.setAdmin2_no(sender_no);
				managerDto2.setMessage_manager_type("수신");
				sqlSession.insert("message.sendManager", managerDto2);
			}
			//본사(주인공)발신으로 보내기
			MessageManagerDto managerDto = new MessageManagerDto();
			managerDto.setMessage_no(message_no);
			managerDto.setAdmin_no(sender_no);
			managerDto.setAdmin2_no(0);//0일경우 전체 지점장에게 발신으로 표시
			managerDto.setMessage_manager_type("발신");
			sqlSession.insert("message.sendManager", managerDto);
		}else if(receiver.length < 2 && receiver[0].equals("전체 회원")){
			List<MemberDto> list = sqlSession.selectList("member.getList");
			//회원(주인공)--수신으로 받기
			for(int i=0;i<list.size();i++) {
				MessageMemberDto memberDto = new MessageMemberDto();
				memberDto.setMessage_no(message_no);
				memberDto.setMessage_member_no(list.get(i).getMember_no());
				memberDto.setAdmin_no(sender_no);
				memberDto.setMessage_member_type("수신");
				sqlSession.insert("message.sendMember", memberDto);
			}
			//본사(주인공) 발신으로 저장
			MessageMemberDto memberDto2 = new MessageMemberDto();
			memberDto2.setMessage_no(message_no);
			memberDto2.setMessage_member_no(0);
			memberDto2.setAdmin_no(sender_no);
			memberDto2.setMessage_member_type("발신");
			sqlSession.insert("message.sendMember", memberDto2);
		}else {
			for(int i=0;i<receiver.length;i++) {
				MessageManagerDto managerDto = new MessageManagerDto();
				//주인공 = 본사(sender)--발신
				managerDto.setMessage_no(message_no);
				managerDto.setAdmin_no(sender_no);
				managerDto.setAdmin2_no(sqlSession.selectOne("admin.getAdminNO",receiver[i]));
				managerDto.setMessage_manager_type("발신");
				sqlSession.insert("message.sendManager", managerDto);
			}
			for(int i=0;i<receiver.length;i++) {
				MessageManagerDto managerDto2 = new MessageManagerDto();
				//주인공 = 받는사람(receiver)--수신
				managerDto2.setMessage_no(message_no);
				managerDto2.setAdmin_no(sqlSession.selectOne("admin.getAdminNO",receiver[i]));
				managerDto2.setAdmin2_no(sender_no);
				managerDto2.setMessage_manager_type("수신");
				sqlSession.insert("message.sendManager", managerDto2);
			}
		}
	}
}
