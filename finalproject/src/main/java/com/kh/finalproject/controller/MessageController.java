package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.VO.MessageVO;
import com.kh.finalproject.repository.MessageDao;
import com.kh.finalproject.service.MessageService;

@Controller
@RequestMapping("/admin/message")
public class MessageController {
	
	@Autowired
	private MessageDao messagedao;
	
	@Autowired
	private MessageService messageService;

	@GetMapping("/send_message_manager")
	public String regist() {
		return "admin/message/send_message_manager";
	}
	@PostMapping("/send_message_manager")
	public String regist(@ModelAttribute MessageVO messageVO) {
		messageService.regist(messageVO);
		return "redirect:send_message_manager";
	}
	
	
}
