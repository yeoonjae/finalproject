package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.VO.PagingVO;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.service.MemberCouponService;

@Controller
@RequestMapping("/member/coupon")
public class MemberCouponController {

	@Autowired
	private MemberCouponService memberCouponService;
	
	@GetMapping("/list")
	public String getList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam (value="cntPerPage", required=false)String cntPerPage
			, HttpSession session) {
		
		MemberDto memberDto = (MemberDto)session.getAttribute("memberinfo");
		int member_no = memberDto.getMember_no();
		
		int total = memberCouponService.countCoupon(member_no);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", memberCouponService.selectCoupon(member_no, vo));
		
		return "member/coupon/list";
	}
}
