package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.VO.PagingVO;
import com.kh.finalproject.entity.NoticeDto;
import com.kh.finalproject.repository.NoticeDao;

@Controller
@RequestMapping("/member/notice")
public class MemberNoticeController {
	@Autowired
	private NoticeDao noticeDao;
	@GetMapping("/list")
	public String list(Model model, PagingVO vo,
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = noticeDao.countNotice();
		if(nowPage ==null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		}else if(nowPage ==null) {
			nowPage ="1";
		}else if(cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		List<NoticeDto> list = noticeDao.selectNotice(vo);
		model.addAttribute("list", list);
		return "member/notice/list";
	}
	@GetMapping("/content")
	public String content(Model model, @RequestParam int notice_no) {
		NoticeDto noticeDto = noticeDao.content(notice_no);
		model.addAttribute("noticeDto", noticeDto);
		return "member/notice/content";
	}
}
