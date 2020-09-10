package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.LocalDto;
import com.kh.finalproject.repository.BranchDao;
import com.kh.finalproject.repository.LocalDao;

@Controller
@RequestMapping("/admin/coupon")
public class CouponController {

	@Autowired
	private LocalDao localDao;
	
	@Autowired
	private BranchDao branchDao;
	
	@GetMapping("/regist")
	public String regist(Model model) {
		// 지역 목록 전달
		List<LocalDto> localList = localDao.getList();
		model.addAttribute("localList", localList);
		
		// 지점 목록 전달
		List<BranchDto> branchList = branchDao.getList();
		model.addAttribute("branchList", branchList);
		
		return "admin/coupon/regist";
	}
}
