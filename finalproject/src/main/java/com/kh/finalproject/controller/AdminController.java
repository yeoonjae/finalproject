package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.AdminDto;
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
	//관리자 등록
	@GetMapping("/regist")
	public String regist(Model model) {
		int admin_no = adminDao.getSeq();
		model.addAttribute("admin_no", admin_no);
		return "admin/regist";
	}
	@PostMapping("/regist")
	public String regist(@ModelAttribute AdminDto adminDto, @RequestParam String email) {
		adminDao.regist(adminDto);
		String text = emailService.documentation(adminDto);
		emailService.sendSimpleMessage(email, "공돌이 관리자 계정", text);
		return "redirect:regist_result";
	}
	//관리자 정보 조회
	@GetMapping("/info/{no}")
	public String info(@PathVariable int no, Model model) {
		AdminDto adminDto = adminDao.get(no);
		model.addAttribute("adminDto", adminDto);
		return "admin/info";
	}
	//관리자 정보 수정
	@GetMapping("/edit/{no}")
	public String edit(Model model, @PathVariable int no) {
		AdminDto adminDto = adminDao.get(no);
		model.addAttribute("adminDto", adminDto);
		return "admin/edit";
	}
	@PostMapping("/edit/{no}")
	public String edit(@ModelAttribute AdminDto adminDto, Model model, @PathVariable int no) {
		adminDao.edit(adminDto);
		AdminDto get = adminDao.get(no);
		model.addAttribute("adminDto", get);
		return "redirect:info";
	}
	//관리자 정보 리스트
	@GetMapping("/list")
	public String list(
			Model model, 
			@RequestParam(required = false, defaultValue = "admin_no") String col,
			@RequestParam(required = false, defaultValue = "asc") String order) {
		List<AdminDto> list = adminDao.getList(col, order);
		model.addAttribute("list", list);
		return "admin/list";
	}
	//관리자 정보 삭제(본점)
	@GetMapping("/delete/{no}")
	public String listdelete(@PathVariable int no) {
		adminDao.delete(no);
		return "admin/list";
	}
	//로그인
	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam String id,@RequestParam String password, HttpSession session) {
		//id랑 password라는 이름으로 requestParam받았습니당
		//중간 처리과정만 Dao만들어서 적어서 완성해주세욤!-연재
		if(adminDao.login(id,password)) {
			int no = adminDao.getNo(id);
			AdminDto find = adminDao.get(no);
			session.setAttribute("admininfo", find);
		}
		return "admin/";
	}
	//로그아웃
	@GetMapping("/logout")
	public String logout(@ModelAttribute AdminDto adminDto, HttpSession httpSession) {
		httpSession.removeAttribute("admininfo");
		return "admin/admin_index";
	}
	
}
