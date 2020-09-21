package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalproject.entity.ChatDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.ChatDao;
import com.kh.finalproject.repository.SeatDao;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private SeatDao seatDao;
	
	@RequestMapping("/")//첫 주소
	public String root() {
		return "member/home_index";
	}
	
	@RequestMapping("/user")//첫 주소
	public String memberRoot(Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto)session.getAttribute("memberinfo");
		int branch_no = memberDto.getBranch_no();
		
		int allCount = seatDao.getAllCount(branch_no);
		int useCount = seatDao.getUseCount(branch_no);
		
		List<ChatDto> list = chatDao.getList();
		
		model.addAttribute("allCount", allCount);
		model.addAttribute("useCount", useCount);
		model.addAttribute("list", list);
		return "member/user_index";
	}
	
	// 해당 유형의 질문 검색 
	@GetMapping("/search")
	@ResponseBody
	public List<ChatDto> search(Model model,@RequestParam int type_no) {
		List<ChatDto> list = chatDao.getList(type_no);
//		model.addAttribute("list", list);
//		return "member/user_index";
		return list;
	}
	
	@GetMapping("/getDetail")
	@ResponseBody
	public List<ChatDto> getDetail(Model model,@RequestParam int chat_no) {
		List<ChatDto> list2= chatDao.getDetailList(chat_no);
//		model.addAttribute("list", list);
//		return "member/user_index";
		return list2;
	}

}
