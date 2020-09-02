package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.LocalDto;
import com.kh.finalproject.repository.BranchDao;
import com.kh.finalproject.repository.LocalDao;

@Controller
@RequestMapping("/admin/branch")
public class BranchController {
		
	@Autowired
	private BranchDao branchDao;
	
	@Autowired
	private LocalDao localDao;
	
	@GetMapping("/branch_regist")
	public String regist(Model model) {
		List<LocalDto> local = localDao.getList();
		//지점관리자 선택하게끔 adminDto만들어야함
		model.addAttribute("local", local);
		return "admin/branch/branch_regist";
	}
	
	//지점 등록 메소드
	@PostMapping("/branch_regist")
	public String regist(Model model,@ModelAttribute BranchDto branchDto) {
		int branch_no = branchDao.regist(branchDto);
		return "redirect:branch_regist";
	}
	
	//지점 목록 메소드
	@GetMapping("/list")
	public String list(Model model) {
		List<BranchDto> list = branchDao.getList();
		model.addAttribute("branch", list);
		return "admin/branch/list";
	}
	
	//지점 배치도 등록
	@GetMapping("/layout_regist")
	public String layout() {
		return "admin/branch/layout_regist";
	}
	
	
}
