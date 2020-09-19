package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalproject.entity.NoticeDto;
import com.kh.finalproject.repository.NoticeDao;

@Controller
@RequestMapping("/member/notice")
public class MemberNoticeController {
	@Autowired
	private NoticeDao noticeDao;
	@GetMapping("/list")
	public String list(Model model) {
		List<NoticeDto> list = noticeDao.list();
		model.addAttribute("list", list);
		return "member/notice/list";
	}
}
