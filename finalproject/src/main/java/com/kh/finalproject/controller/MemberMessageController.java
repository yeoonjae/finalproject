package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.MessageMemberDto;
import com.kh.finalproject.repository.MessageDao;
import com.kh.finalproject.service.MessageService;

@Controller
@RequestMapping("/member/message")
public class MemberMessageController {

	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private MessageService messageService;
	
	@GetMapping("/message")
	public String inbox(HttpSession session,Model model) {
		MemberDto memberDto = (MemberDto)session.getAttribute("memberinfo");
		System.out.println(memberDto);
		int member_no = memberDto.getMember_no();
		List<MessageMemberDto> list = messageDao.inboxMember(member_no);
		model.addAttribute("list", list);
		return "/member/message/message";
		}
	
	@PostMapping("/message_member_delete_inbox")
	public String inboxMember(@RequestParam int message_member_no) {
		messageService.deleteInboxMemeber(message_member_no);
		return "redirect:message";
	}
}
