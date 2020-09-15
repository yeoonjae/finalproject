package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.BranchImgDto;
import com.kh.finalproject.repository.BranchDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/franchisee")
public class FranchiseeController {
	
	@Autowired
	private BranchDao branchDao;
	
	@GetMapping("/list")
	public String list(Model model) {
		List<BranchDto> list = branchDao.getList();
		model.addAttribute("list", list);
		log.info("", msg);
		return "/member/franchisee/list";
	}
}
