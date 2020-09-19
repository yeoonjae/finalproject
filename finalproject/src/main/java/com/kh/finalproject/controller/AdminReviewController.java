package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.repository.ReviewDao;

@Controller
@RequestMapping("/admin/review")
public class AdminReviewController {

	@Autowired
	private ReviewDao reviewDao;
	
	
	@GetMapping("/list")
	public String list(HttpSession session,Model model) {
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		if(adminDto.getAdmin_auth().equals("본사")) {
			model.addAttribute("list", reviewDao.getAdminList());
		}else {
			//지점장 no로 지점번호 뽑기
//			int branch_no = 
		}
		return "admin/review/list";
	}
}
