package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return "redirect:license_list";
	}
	
	// 이용권 목록 
	@GetMapping("/license_list")
	public String getList(Model model) {
		List<LicenseDto> list = licenseDao.getList();
		model.addAttribute("list", list);
		return "admin/license/license_list";
	}
	
	// 이용권 수정 
	@PostMapping("/license_edit")
	@ResponseBody
	public String edit(@ModelAttribute LicenseDto licenseDto) {
		licenseDao.edit(licenseDto);
		return "admin/license/license_list";
	}
	
	// 이용권 삭제 
	@GetMapping("/license_delete/{license_no}")
	public String delete(@PathVariable int license_no) {
		licenseDao.delete(license_no);
		return "redirect:/admin/license/license_list";
	}
}
