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

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.service.MemberService;

@Controller
@RequestMapping("/member/account")
public class MemberAccountController {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MemberService memberService;
	//회원 가입
	@GetMapping("/join")
	public String join() {
		return "member/account/join";
	}
	@PostMapping("/join")
	public String join(@ModelAttribute MemberDto memberDto) {
		memberDao.write(memberDto);
		return "member/account/join_result";
	}
	// 회원 정보 리스트
	@GetMapping("/list")
	public String list(Model model) {
		List<MemberDto> list = memberDao.getList();
		model.addAttribute("list", list);
		return "member/account/list";
	}

	// 회원 정보 상세보기
	@GetMapping("/info")
	public String info(@RequestParam int no, Model model) {
		MemberDto memberDto = memberDao.get(no);
		model.addAttribute("memberDto", memberDto);
		return "member/account/info";
	}

	// 회원 정보 편집
	@GetMapping("/edit")
	public String edit(@RequestParam int no, Model model) {
		MemberDto memberDto = memberDao.get(no);
		model.addAttribute("memberDto", memberDto);
		return "member/account/edit";
	}

	@PostMapping("/edit")
	public String edit(RedirectAttributes attr, @ModelAttribute MemberDto memberDto) {
		memberDao.edit(memberDto);
		int no = memberDto.getMember_no();
		attr.addAttribute("member_no", no);
		return "redirect:info";
	}

	// 회원 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int no, HttpSession session) {
		memberDao.delete(no);

		if (session.getAttribute("admininfo") != null) {
			return "member/account/list";
		} else {
			return "member/member_index";
		}
	}
	//회원 비밀번호 확인 검사
	@GetMapping("/check")
	public String check(@RequestParam String pw, HttpSession session) {
		if(mememberService)
	}
	
}
