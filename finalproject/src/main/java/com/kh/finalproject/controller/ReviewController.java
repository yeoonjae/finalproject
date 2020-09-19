package com.kh.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.ReviewDto;

@Controller
@RequestMapping("/member/review")
public class ReviewController {

	//리뷰 등록
	@GetMapping("/regist")
	public String regist() {
		return "member/review/regist";
	}
	
	//리뷰 등록
	@PostMapping("/regist")
	public String regist(@ModelAttribute ReviewDto reviewDto) {
		return "redirect:list";
	}
	
	//리뷰 리스트
	@GetMapping("/list")
	public String list() {
		return "member/review/list";
	}
	
}
