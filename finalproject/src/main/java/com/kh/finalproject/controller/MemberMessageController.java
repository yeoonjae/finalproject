package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.VO.PagingVO;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.MessageDao;
import com.kh.finalproject.service.MessageService;

@Controller
@RequestMapping("/member/message")
public class MemberMessageController {

	@Autowired
	private MessageDao messageDao;
	
	@Autowired
	private MessageService messageService;
	
	@GetMapping("/message")
	public String inbox(PagingVO vo,HttpSession session,Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			) {
		MemberDto memberDto = (MemberDto)session.getAttribute("memberinfo");
		int total = messageService.countMessage(memberDto.getMember_no());
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("list", messageService.inboxMember(memberDto.getMember_no(), vo));
		return "/member/message/message";
		}
	
	@PostMapping("/message_member_delete_inbox")
	public String inboxMember(
			@RequestParam int message_member_no,
			@RequestParam int nowPage,
			@RequestParam int cntPerPage,
			RedirectAttributes attr) {
		messageService.deleteInboxMemeber(message_member_no);
		attr.addAttribute("nowPage", nowPage);
		attr.addAttribute("cntPerPage", cntPerPage);
		return "redirect:message";
	}
}
