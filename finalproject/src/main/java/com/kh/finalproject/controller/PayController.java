package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.LicenseDto;
import com.kh.finalproject.entity.MemberBranchDto;
import com.kh.finalproject.repository.LicenseDao;
import com.kh.finalproject.repository.PayDao;

@Controller
@RequestMapping("/member/pay")
public class PayController {
	
	@Autowired
	private LicenseDao licenseDao;
	private PayDao payDao;
	
//	@GetMapping("/pay_page")
//	public String pay() {
//		return "member/pay/pay_page";
//	}
	
	@GetMapping("/pay_page")
	public String getList(Model model) {
		// 이용권 리스트 가져오기
		List<LicenseDto> list = licenseDao.getList();
		model.addAttribute("list", list);
		
		return "member/pay/pay_page";
	}
	
	@GetMapping("/pay_page/{member_no}")
	public String getBranch(@PathVariable int member_no, Model model) {

		MemberBranchDto memberBranchDto = payDao.getBranch(member_no);
		model.addAttribute("memberBranchDto",memberBranchDto);
		
		//attr.addAttribute("branch_no", branch_no);
		return "member/pay/pay_page";
	}
}
