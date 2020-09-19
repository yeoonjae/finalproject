package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.repository.AdminDao;
import com.kh.finalproject.service.EmailService;

@Controller
@RequestMapping("/admin/account")
public class AccountController {
	@Autowired
	private AdminDao adminDao;
	@Autowired
	private EmailService emailService;
	//관리자 등록
		@GetMapping("/regist")
		public String regist(Model model) {
			int admin_no = adminDao.getSeq();
			model.addAttribute("admin_no", admin_no);
			return "admin/account/regist";
		}
		@PostMapping("/regist")
		public String regist(@ModelAttribute AdminDto adminDto, @RequestParam String email) {
			String text = emailService.documentation(adminDto);
			emailService.sendSimpleMessage(email, "공돌이 관리자 계정", text);
			adminDao.regist(adminDto);
			return "admin/account/regist_result";
		}
		//관리자 정보 조회
		@GetMapping("/info")
		public String info(@RequestParam int admin_no, Model model) {
			AdminDto adminDto = adminDao.get(admin_no);
			model.addAttribute("adminDto", adminDto);
			return "admin/account/info";
		}
		//관리자 정보 수정
		@GetMapping("/edit")
		public String edit(Model model, @RequestParam int admin_no) {
			AdminDto adminDto = adminDao.get(admin_no);
			model.addAttribute("adminDto", adminDto);
			return "admin/account/edit";
		}
		@PostMapping("/edit")
		public String edit(@RequestParam("admin_no") int admin_no, 
				@ModelAttribute AdminDto adminDto,
				Model model,  HttpSession session, ModelMap modelMap) {
			adminDao.edit(adminDto);
			AdminDto get = adminDao.get(adminDto.getAdmin_no());
			model.addAttribute("adminDto", get);
			AdminDto admin_auth = (AdminDto) session.getAttribute("admininfo");
			if(admin_auth.getAdmin_auth().equals("본사")) {
				return "admin/accunot/list";
			}
			modelMap.addAttribute("admin_no", admin_no);
			return "admin/account/info";
		}
		
		//관리자 정보 리스트(본점)
		@GetMapping("/list")
		public String list(
				Model model, 
				@RequestParam(required = false, defaultValue = "admin_no") String col,
				@RequestParam(required = false, defaultValue = "asc") String order) {
			List<AdminDto> list = adminDao.getList(col, order);
			model.addAttribute("list", list);
			return "admin/account/list";
		}
		//관리자 정보 삭제(본점)
		@GetMapping("/delete")
		public String listdelete(@RequestParam int admin_no) {
			adminDao.delete(admin_no);
			return "redirect:list";
		}
		//로그인
		@GetMapping("/login")
		public String login() {
			return "admin/account/login";
		}
		
		@PostMapping("/login")
		public String login(@RequestParam String admin_id,@RequestParam String admin_pw, HttpSession session) {
			if(adminDao.login(admin_id,admin_pw)) {
				int no = adminDao.getNo(admin_id);
				adminDao.updateLoginTime(no);
				AdminDto find = adminDao.get(no);
				session.setAttribute("admininfo", find);
				return "admin/admin_index";
			}else {
				return "redirect:login?error=error";
			}
		}
		//로그아웃
		@GetMapping("/logout")
		public String logout(@ModelAttribute AdminDto adminDto, HttpSession httpSession) {
			httpSession.removeAttribute("admininfo");
			return "admin/admin_index";
		}
}
