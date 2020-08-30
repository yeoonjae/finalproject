package com.kh.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/")//첫 주소
	public String root() {
		return "admin/admin_index";
	}

	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam String id,@RequestParam String password) {
		//id랑 password라는 이름으로 requestParam받았습니당
		//중간 처리과정만 Dao만들어서 적어서 완성해주세욤!-연재
		return "admin/";
	}
}
