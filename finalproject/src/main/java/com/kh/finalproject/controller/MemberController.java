package com.kh.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

	@RequestMapping("/")//첫 주소
	public String root() {
		return "member/home_index";
	}
	
	@RequestMapping("/user")//첫 주소
	public String memberRoot() {
		return "member/user_index";
	}
}
