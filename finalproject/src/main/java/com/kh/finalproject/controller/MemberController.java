package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalproject.entity.ChatDto;
import com.kh.finalproject.repository.ChatDao;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private ChatDao chatDao;
	
	@RequestMapping("/")//첫 주소
	public String root() {
		return "member/home_index";
	}
	
	@RequestMapping("/user")//첫 주소
	public String memberRoot(Model model) {
		List<ChatDto> list = chatDao.getList();
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
