package com.kh.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {
	@RequestMapping("/")
	public String root() {
		return "/member/home";
	}
	@RequestMapping("/login")
	public String loing() {
		return "member/login";
	}
	
}
