package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.repository.BranchDao;

@Controller
@RequestMapping("/admin")
public class BranchController {
		
	@Autowired
	private BranchDao branchDao;
	
	@GetMapping("/local_regist")
	public String regist() {
		return "admin/branch/local_regist";
	}
	
	//지역 등록 메소드
	@PostMapping("/local_regist")
	public String regist(@ModelAttribute BranchDto branchDto) {
		return "redirect:branch_regist";
	}
}
