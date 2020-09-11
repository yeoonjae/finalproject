package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.VO.MessageVO;
import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.MessageManagerDto;
import com.kh.finalproject.entity.MessageMemberDto;
import com.kh.finalproject.repository.AdminDao;
import com.kh.finalproject.repository.MessageDao;
import com.kh.finalproject.service.MessageService;

@Controller
@RequestMapping("/admin/message")
public class MessageController {
	
	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private AdminDao adminDao;
	
	@GetMapping("/send_message_manager")
	public String regist(HttpSession session, Model model) {
		//session에서 정보를 꺼내서 해당사람의 수신내용 발신내용 보기
		AdminDto adminDto2 = (AdminDto)session.getAttribute("admininfo");
		int admin_no = adminDto2.getAdmin_no();
		System.out.println(admin_no);
		String admin_auth = adminDto2.getAdmin_auth();
		if(admin_auth.equals("본사")) {//본사일때
			List<MessageManagerDto> inbox = messageDao.inbox(admin_no);
			List<MessageManagerDto> outbox = messageDao.outboxManager(admin_no);
			model.addAttribute("inbox", inbox);
			model.addAttribute("outbox", outbox);
		}else {//지점장일때
			List<MessageManagerDto> inbox = messageDao.inbox(admin_no);
			List<MessageMemberDto> outbox = messageDao.outboxBranchManager(admin_no);
			model.addAttribute("inbox", inbox);
			model.addAttribute("outbox", outbox);

		}
		return "admin/message/send_message_manager";
	}
	
	@PostMapping("/send_message_manager")
	public String regist(@ModelAttribute MessageVO messageVO,HttpSession session) {
		AdminDto adminDto = (AdminDto) session.getAttribute("admininfo");
		messageService.regist(messageVO,adminDto);
		return "redirect:send_message_manager";
	}
	
	@GetMapping("/message_delete")
	public String delete() {
		return "redirect:send_message_manager";
	}
	
	//관리자 수신함 삭제
	@PostMapping("/message_delete_inbox")
	public String deleteInbox(@RequestParam int message_manager_no,RedirectAttributes attr ) {
		messageService.deleteInbox(message_manager_no);
		attr.addAttribute("where", "inbox");
		return "redirect:send_message_manager";
	}
	
	//관리자 발신함 삭제
	@PostMapping("/message_delete_outbox")
	public String deleteOutbox(@RequestParam int message_manager_no,RedirectAttributes attr ) {
		messageService.deleteOutbox(message_manager_no);
		attr.addAttribute("where", "outbox");
		return "redirect:send_message_manager";
	}
}
