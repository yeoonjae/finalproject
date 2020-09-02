package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.LicenseDto;
import com.kh.finalproject.repository.LicenseDao;

@Controller
@RequestMapping("/member/pay")
public class PayController {
	
	@Autowired
	private LicenseDao licenseDao;
	
//	@GetMapping("/pay_page")
//	public String pay() {
//		return "member/pay/pay_page";
//	}
	
	@GetMapping("/pay_page")
	public String getList(Model model) {
		List<LicenseDto> list = licenseDao.getList();
		model.addAttribute("list", list);
		return "member/pay/pay_page";
	}
	
	@GetMapping("/pay_page")
	public String getBranch() {
		
		return "member/pay/pay_page";
	}
}
