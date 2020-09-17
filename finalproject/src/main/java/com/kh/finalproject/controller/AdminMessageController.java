package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.VO.MessageVO;
import com.kh.finalproject.VO.PagingVO;
import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.MessageManagerDto;
import com.kh.finalproject.entity.MessageMemberDto;
import com.kh.finalproject.repository.AdminDao;
import com.kh.finalproject.repository.MessageDao;
import com.kh.finalproject.service.MessageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/message")
public class AdminMessageController {
	
	@Autowired
	private MessageService messageService;
	
	//메세지 창
	@GetMapping("/send")
	public String regist(HttpSession session, Model model) {
		return "admin/message/send";
	}
	
	//쪽지 보내기
	@PostMapping("/send")
	public String regist(@ModelAttribute MessageVO messageVO,HttpSession session) {
		AdminDto adminDto = (AdminDto) session.getAttribute("admininfo");
		messageService.regist(messageVO,adminDto);
		return "redirect:send";
	}
	
	//관리자 수신함 삭제
	@PostMapping("/message_delete_inbox")
	public String deleteInbox(
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage,
			@RequestParam int message_manager_no,
			RedirectAttributes attr) {
		System.out.println("delete_inbox controller들어옴");
		messageService.deleteInbox(message_manager_no);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		return "redirect:inbox";
	}
	
	//관리자 발신함 삭제
	@PostMapping("/message_delete_outbox")
	public String deleteOutbox(
			@RequestParam(value="nowPage", required=false)String nowPage,
			@RequestParam(value="cntPerPage", required=false)String cntPerPage,
			@RequestParam int message_manager_no,
			RedirectAttributes attr
		) {
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		messageService.deleteOutbox(message_manager_no);
		return "redirect:outbox";
	}
	
	//발신함
	@GetMapping("/outbox")
	public String outbox(PagingVO vo,HttpSession session, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			) {
		//session에서 정보를 꺼내서 해당사람의 수신내용 발신내용 보기
		AdminDto adminDto2 = (AdminDto)session.getAttribute("admininfo");
		int admin_no = adminDto2.getAdmin_no();
		String admin_auth = adminDto2.getAdmin_auth();
		model.addAttribute("paging", vo);
		if(admin_auth.equals("본사")) {//본사일때
			int total = messageService.outboxCountTotalManager(admin_no);
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
			List<MessageMemberDto> outbox = messageService.outboxTotalManager(admin_no,vo);
			model.addAttribute("outbox", outbox);
		}else {//지점장일때
			int total = messageService.outboxCountBranchManager(admin_no);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			//받아오는 페이지 번호
			model.addAttribute("paging", vo);
			//지점 관리자 발신함
			List<MessageMemberDto> outbox = messageService.outboxBranchManager(admin_no,vo);
			model.addAttribute("outbox", outbox);
		}
		return "admin/message/outbox";
	}
	
	//수신함
	@GetMapping("/inbox")
	public String inbox(PagingVO vo,HttpSession session, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			) {
		AdminDto adminDto2 = (AdminDto)session.getAttribute("admininfo");
		System.out.println("adminDto2 = "+adminDto2);
		int admin_no = adminDto2.getAdmin_no();
		System.out.println("no : "+admin_no);
		int total = messageService.inboxCountManager(admin_no);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		//받아오는 페이지 번호
		model.addAttribute("paging", vo);
		//지점 본사 수신함
		List<MessageManagerDto> inbox = messageService.inboxManager(admin_no,vo);
		model.addAttribute("inbox", inbox);
		return "admin/message/inbox";
	}
	
}