package com.kh.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/seat")
public class MemberSeatController {

	@GetMapping("/select")
	public String select() {
		return "member/seat/select";
	}
	
}
