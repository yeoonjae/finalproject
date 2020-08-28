package com.kh.finalproject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.repository.PointDao;

@Controller
@RequestMapping("/admin")
public class PointController {
	@Autowired
	private PointDao pointDao;
	
	@GetMapping("/point/regist")
	public String regist() {
		return "admin/point/regist";
	}
	
	@PostMapping("/point/regist")
	public String regist(@ModelAttribute PointDto pointDto) {
		pointDao.regist(pointDto);
		return "redirect:list";
	}
}
