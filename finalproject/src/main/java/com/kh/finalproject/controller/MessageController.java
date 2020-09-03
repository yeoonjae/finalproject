package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/message")
public class MessageController {

	@GetMapping("/send_member")
	public String regist() {
		return "admin/message/send_member";
	}
	@PostMapping("/send_member")
	public String regist(String a) {
		return "redirect:regist";
	}
	
}
