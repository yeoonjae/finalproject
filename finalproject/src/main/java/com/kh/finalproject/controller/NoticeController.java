package com.kh.finalproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.NoticeDto;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@GetMapping("/write")
	public String write() {		
		return "notice/write";
	}
	@PostMapping("/write")
	public String write(@ModelAttribute NoticeDto noticeDto) {
		return "notice/content";
	}
	@GetMapping("/list")
	public String list(Model model) {	
		
		return "notice/list";
	}
	@GetMapping("/content")
	public String content() {		
		return "notice/content";
	}
	@GetMapping("/edit")
	public String edit(Model model) {		
		return "notice/edit";
	}
	@PostMapping("/edit")
	public String edit(@ModelAttribute NoticeDto noticeDto) {	
		return "notice/content";
	}
	@GetMapping("/delete")
	public String delete(@RequestParam int notice_no) {		
		return "notice/delete";
	}
}
