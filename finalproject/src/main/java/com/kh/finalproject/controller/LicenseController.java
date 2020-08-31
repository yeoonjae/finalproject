package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.LicenseDto;
import com.kh.finalproject.repository.LicenseDao;

@Controller
@RequestMapping("/admin/license")
public class LicenseController {
	
	@Autowired
	private LicenseDao licenseDao;
	
	//	이용권 등록
	@GetMapping("/license_regist")
	public String regist() {
		return "admin/license/license_regist";
	}
	
	@PostMapping("/license_regist")
	public String regist(@ModelAttribute LicenseDto licenseDto) {
		licenseDao.regist(licenseDto);
		return "redirect:license_regist";
	}
	
	// 이용권 목록 
	@GetMapping("/license_getList")
	public String getList(Model model) {
		
		List<LicenseDto> list = licenseDao.getList();
		model.addAttribute("list", list);
		return "admin/license/license_list";
	}
}
