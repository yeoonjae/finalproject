package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.entity.ChatDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.ChatDao;

@Controller
@RequestMapping("/admin/chat")
public class ChatController {

	@Autowired
	private ChatDao chatDao;
	
	@GetMapping("/regist")
	public String chat_regist(Model model, 
							@RequestParam(required = false, defaultValue = "all") String chat_type) {
		List<ChatDto> list = chatDao.getList(chat_type);
		model.addAttribute("list", list);
		return "/admin/chat/regist"; 
	}
	
	@PostMapping("/regist")
	public String chat_regist(Model model,
								@ModelAttribute ChatDto chatDto,
								@RequestParam(required = false, defaultValue = "all") String chat_type) {
		List<ChatDto> list = chatDao.getList(chat_type);
		model.addAttribute("list", list);
		
		chatDao.regist(chatDto);
		return "redirect:regist"; 
	}
	
	@PostMapping("/list1")
	public String getList1(Model model, 
								RedirectAttributes attr, 
								@RequestParam(required = false, defaultValue = "all") String chat_type) {
		
		List<ChatDto> list = chatDao.getList(chat_type);
		model.addAttribute("list", list);
		
		attr.addAttribute("chat_type", chat_type);
		return "redirect:regist";
	}
	

	
}



