package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.CertDto;
import com.kh.finalproject.entity.LocalDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.BranchDao;
import com.kh.finalproject.repository.CertDao;
import com.kh.finalproject.repository.LocalDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.service.CertService;
import com.kh.finalproject.service.EmailService;
import com.kh.finalproject.service.MemberService;

@Controller
@RequestMapping("/member/account")
public class MemberAccountController {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MemberService memberService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private CertService certService;
	@Autowired
	private CertDao certDao;
	@Autowired
	private BranchDao branchDao;
	@Autowired
	private LocalDao localDao;
	//회원 가입
	@GetMapping("/join")
	public String join(Model model) {
		int member_no = memberDao.getSeq();
		model.addAttribute("member_no", member_no);
		List<BranchDto> branchDto = branchDao.getList();
		model.addAttribute("branchDto", branchDto);
		List<LocalDto> localDto = localDao.getList();
		model.addAttribute("localDto",localDto);
		return "member/account/join";
	}
	@PostMapping("/join")
	public String join(@ModelAttribute MemberDto memberDto, HttpServletRequest request) {
		String ip = request.getRemoteAddr();
		String secret =certService.generateCertification(ip);
		emailService.sendSimpleMessage(memberDto.getMember_email(), "공돌이 인증번호", "인증번호: " + secret);
		return "member/account/cert_email";
	}
	//이메일 인증
	@GetMapping("/cert_email")
	public String certEmail(@ModelAttribute MemberDto memberDto, Model model){
		model.addAttribute("memberDto", memberDto);
		return "member/account/cert_email";
	}
	@PostMapping("/cert_email")
	public String certEmail(@ModelAttribute MemberDto memberDto){	
			memberDao.join(memberDto);	
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
	public String info(@RequestParam int member_no, Model model) {
		MemberDto memberDto = memberDao.get(member_no);
		model.addAttribute("memberDto", memberDto);
		return "member/account/info";
	}

	// 회원 정보 편집
	@GetMapping("/edit")
	public String edit(@RequestParam int member_no, Model model) {
		MemberDto memberDto = memberDao.get(member_no);
		model.addAttribute("memberDto", memberDto);
		List<BranchDto> branchDto = branchDao.getList();
		model.addAttribute("branchDto", branchDto);
		List<LocalDto> localDto = localDao.getList();
		model.addAttribute("localDto",localDto);
		return "member/account/edit";
	}

	@PostMapping("/edit")
	public String edit(RedirectAttributes attr, @ModelAttribute MemberDto memberDto, HttpSession session) {
		memberDao.edit(memberDto);
		int member_no = memberDto.getMember_no();
		if(session.getAttribute("admininfo") != null){
			return "redirect:list";
		}
		attr.addAttribute("member_no", member_no);
		return "redirect:info";
	}

	// 회원 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int member_no, HttpSession session) {
		session.removeAttribute("memberinfo");
		memberDao.delete(member_no);
		if (session.getAttribute("admininfo") != null) {
			return "member/account/list";
		} else {
			return "member/account/delete_result";
		}
	}
	//로그인
	@GetMapping("/login")
	public String login() {
		return "member/account/login";
	}
	@PostMapping("/login")
	public String login(@RequestParam String member_email, @RequestParam String member_pw,
			HttpSession session) {
		if(memberDao.login(member_email,member_pw)) {
			int member_no = memberDao.getNo(member_email);
			memberDao.updateLoginTime(member_no);
			MemberDto find = memberDao.get(member_no);
			session.setAttribute("memberinfo", find);
			return "member/user_index";
		}else {
			return "redirect:login?error=error";
		}
	}
	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("memberinfo");
		return "member/home_index";
	}
	//회원 비밀번호 확인 검사
	@GetMapping("/check")
	public String check() {
		return "member/account/check";
	}
	@PostMapping("/check")
	public String check(@RequestParam String member_pw, HttpSession session, RedirectAttributes attr) {
		MemberDto find = (MemberDto) session.getAttribute("memberinfo");		
		if(memberService.check(member_pw, session)) {
			attr.addAttribute("member_no", find.getMember_no());
			return "redirect:edit";
		}
		return "redirect:check?error=error";
	}
	//회원 탈퇴 확인 검사
	@GetMapping("/check_delete")
	public String check_delete() {
		return "member/account/check_delete";
	}
	@PostMapping("/check_delete")
	public String check_delete(@RequestParam String member_pw, HttpSession session, RedirectAttributes attr) {
		MemberDto find = (MemberDto) session.getAttribute("memberinfo");		
		if(memberService.check(member_pw, session)) {
			attr.addAttribute("member_no", find.getMember_no());
			return "redirect:delete";
		}
		return "redirect:check_delete?error=error";
	}
	//이메일 찾기
	@GetMapping("/find_email")
	public String findId() {
		return "member/account/find_email";
	}
	@PostMapping("/find_email")
	public String findId(@RequestParam String member_name ,Model model) {
		List<String> member_email = memberDao.getId(member_name);
		model.addAttribute("member_email", member_email);
		return "member/account/find_email_result";
	}
	//비밀번호 찾기 이메일 인증
	@GetMapping("/find_pw")
	public String findPw() {
		return "member/account/find_pw";
	}
	@PostMapping("/find_pw")
	public String findPw(@RequestParam String member_email, 
			HttpServletRequest request, RedirectAttributes attr
			) {
		String ip = request.getRemoteAddr();
		String secret =certService.generateCertification(ip);
		attr.addAttribute("member_email", member_email);
		emailService.sendSimpleMessage(member_email, "공돌이 인증번호", "인증번호: " + secret);
		return "redirect:find_pw_check";
	}
	//이메일 인증 번호 받기
	@GetMapping("/find_pw_check")
	public String findPwCheck(Model model, @RequestParam String member_email) {
		model.addAttribute("member_email", member_email);
		return "member/account/find_pw_check";
	}
	@PostMapping("/find_pw_check")
	public String check(@RequestParam String secret, String member_email,
			HttpServletRequest request, RedirectAttributes attr
			) {
		String ip = request.getRemoteAddr();
		boolean result = certDao.validate(CertDto.builder().who(ip).secret(secret).build());
		if(result) {
			int no = memberDao.getNo(member_email);
			attr.addAttribute("member_no", no);
			return "redirect:change_pw";
		}
		return "redirect:find_pw_check?error=error";
	}
	//비번 바꾸기
	@GetMapping("/change_pw")
	public String changePw(@RequestParam int member_no, Model model) {
		MemberDto memberDto = memberDao.get(member_no);
		model.addAttribute("memberDto", memberDto);
		return "member/account/change_pw";
	}
	@PostMapping("/change_pw")
	public String changePw(@RequestParam("member_no") int no, @RequestParam String member_pw,
			RedirectAttributes attr, HttpSession session) {
		memberDao.changePw(no, member_pw);
		
		MemberDto memberDto  = memberDao.get(no);
		session.setAttribute("memberinfo", memberDto);
		attr.addAttribute("member_no", no);
		return "redirect:info";
	}
}
