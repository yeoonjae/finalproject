package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.repository.AdminDao;
import com.kh.finalproject.service.EmailService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private EmailService emailService;
	
	@RequestMapping("/")//첫 주소
	public String root() {
		return "admin/admin_index";
	}
	//등록
	@GetMapping("/regist")
	public String join() {
		
		return "admin/regist";
	}
	@PostMapping("/regist")
	public String regist(@ModelAttribute AdminDto adminDto, @RequestParam String email) {
		adminDao.regist(adminDto);
		String text = emailService.documentation(adminDto);
		emailService.sendSimpleMessage(email, "공돌이 관리자 계정", text);
		return "redirect:regist_result";
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
	@GetMapping("/logout")
	public String logout(@ModelAttribute BranchDto branchDto, HttpSession httpSession) {
		httpSession.removeAttribute("branchInfo");
		return "admin/admin_index";
	}
}
