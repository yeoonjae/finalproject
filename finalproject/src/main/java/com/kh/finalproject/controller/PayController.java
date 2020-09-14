package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.kh.finalproject.entity.LicenseDto;
import com.kh.finalproject.entity.MemberBranchDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PayInfoDto;
import com.kh.finalproject.repository.LicenseDao;
import com.kh.finalproject.repository.PayDao;

@Controller
@RequestMapping("/member/pay")
public class PayController {
	
	@Autowired
	private LicenseDao licenseDao;
	
	@Autowired
	private PayDao payDao;

	
	@GetMapping("/pay_main")
	public String getBranch(Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("memberinfo"); 
		int member_no = memberDto.getMember_no();
		
		// 이용권 리스트 가져오기 
		List<LicenseDto> list = licenseDao.getList();
		model.addAttribute("list", list);
		
		// 회원 지점명 가져오기 
		MemberBranchDto memberBranchDto = payDao.getBranch(member_no);
		model.addAttribute("memberBranchDto",memberBranchDto);
		
		return "member/pay/pay_main";
	}
	
	@RequestMapping("/pay_detail")
	public String getPayIist(Model model,HttpSession session) {
		
		MemberDto memberDto = (MemberDto) session.getAttribute("memberinfo"); 
		int member_no = memberDto.getMember_no();
		
		List<PayInfoDto> list = payDao.getPayInfo(member_no); 		
		model.addAttribute("list", list);
		
		return "member/pay/pay_detail";
	}
	
}
