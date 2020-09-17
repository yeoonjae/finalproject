package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.entity.NoticeDto;
import com.kh.finalproject.repository.NoticeDao;

@Controller
@RequestMapping("admin/notice")
public class NoticeController {
	@Autowired
	private NoticeDao noticeDao;
	@GetMapping("/write")
	public String write() {		
		return "admin/notice/write";
	}
	@PostMapping("/write")
	public String write(@ModelAttribute NoticeDto noticeDto, RedirectAttributes attr) {
		int notice_no = noticeDao.write(noticeDto);
		attr.addAttribute("notice_no", notice_no);
		return "redirect:content";
	}
	@GetMapping("/list")
	public String list(Model model) {	
		List<NoticeDto> list =noticeDao.list();
		model.addAttribute("list", list);
		return "admin/notice/list";
	}
	@GetMapping("/content")
	public String content(Model model, @RequestParam int notice_no) {
		NoticeDto noticeDto = noticeDao.content(notice_no);
		model.addAttribute("noticeDto", noticeDto);
		return "admin/notice/content";
	}
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam int notice_no) {		
		NoticeDto noticeDto = noticeDao.content(notice_no);
		model.addAttribute("noticeDto", noticeDto);
		return "admin/notice/edit";
	}
	@PostMapping("/edit")
	public String edit(@ModelAttribute NoticeDto noticeDto,
			@RequestParam ("notice_no") int notice_no,
			ModelMap modelMap) {
		noticeDao.edit(noticeDto);
		modelMap.addAttribute("notice_no", notice_no);
		return "admin/notice/content";
	}
	@GetMapping("/delete")
	public String delete(@RequestParam int notice_no) {		
		noticeDao.delete(notice_no);
		return "redirect:list";
	}
}
