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

import com.kh.finalproject.VO.MessageVO;
import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.MessageManagerDto;
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
		//임시로 저장해둔 세션
		AdminDto adminDto = adminDao.get(1);
		session.setAttribute("admininfo", adminDto);
		//session에서 정보를 꺼내서 해당사람의 수신내용 발신내용 보기
		AdminDto adminDto2 = (AdminDto) session.getAttribute("admininfo");
		int admin_no = adminDto2.getAdmin_no();
		List<MessageManagerDto> inbox = messageDao.inbox(admin_no);
		List<MessageManagerDto> outbox = messageDao.outbox(admin_no);
		model.addAttribute("inbox", inbox);
		model.addAttribute("outbox", outbox);
		return "admin/message/send_message_manager";
	}
	
	@PostMapping("/send_message_manager")
	public String regist(@ModelAttribute MessageVO messageVO) {
		System.out.println(messageVO.getReceiver_name());
		messageService.regist(messageVO);
		return "redirect:send_message_manager";
	}
	
	@GetMapping("/message_delete")
	public String delete() {
		return "redirect:send_message_manager";
	}
	
	@PostMapping("/message_delete")
	public String delete(@RequestParam int message_manager_no) {
		messageDao.delete(message_manager_no);
		return "redirect:send_message_manager";
	}
	
}
