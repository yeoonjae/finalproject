package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.ReviewDto;
import com.kh.finalproject.repository.ReviewDao;

@Controller
@RequestMapping("/member/review")
public class ReviewController {
	
	@Autowired
	private ReviewDao reviewDao;
	
	//리뷰 등록
	@PostMapping("/regist")
	public String regist(@ModelAttribute ReviewDto reviewDto) {
		reviewDao.regist(reviewDto);
		return "redirect:list";
	}
	
	//리뷰 리스트
	@GetMapping("/list")
	public String list(Model model,HttpSession session) {
		MemberDto memberDto = (MemberDto)session.getAttribute("memberinfo");
		model.addAttribute("list", reviewDao.getList(memberDto.getBranch_no()));
		return "member/review/list";
	}
	
	//리뷰 수정
	@PostMapping("/edit")
	public String edit(
			@RequestParam String review_title,
			@RequestParam String review_content,
			@RequestParam int review_no) {
		reviewDao.edit(review_title,review_content,review_no);
		return "redirect:list";
	}
	
	//리뷰 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int review_no) {
		System.out.println("삭제컨트롤러 들어옴");
		reviewDao.delete(review_no);
		return "redirect:list";
	}
}
