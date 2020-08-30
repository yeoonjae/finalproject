package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.repository.LocalDao;

@Controller
@RequestMapping("/admin/branch")
public class LocalController {

	@Autowired
	private LocalDao localDao;
	
	@GetMapping("local_regist")
	public String regist() {
		return "admin/branch/local_regist";
	}
	
	@PostMapping("local_regist")
	public String regist(@RequestParam String local_name) {
		localDao.regist(local_name);
		return "redirect:local_regist";
	}
}
