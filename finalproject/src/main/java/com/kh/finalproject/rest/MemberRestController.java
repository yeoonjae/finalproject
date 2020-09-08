package com.kh.finalproject.rest;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.entity.CertDto;
import com.kh.finalproject.repository.CertDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.service.CertService;
import com.kh.finalproject.service.EmailService;

@RestController
@RequestMapping("/member_rest")
public class MemberRestController {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private EmailService emailService;
	@Autowired
	private CertService certService;
	@Autowired
	private CertDao certDao;
	//중복 확인
	@GetMapping("/overlap")
	public int overlap(@RequestParam String member_email) {
		int member_no = memberDao.getNo(member_email);
		return member_no;
	}
	//이메일 발송
	@GetMapping("/send_email")
	public void sendEmail(@RequestParam String member_email, HttpServletRequest request) {
		String ip = request.getRemoteAddr();
		String secret =certService.generateCertification(ip);
		emailService.sendSimpleMessage(member_email, "공돌이 인증번호", "인증번호: " + secret);	
	}
	//이메일 인증
	@GetMapping("/cert_email")
	public boolean certEmail(@RequestParam String secret, HttpServletRequest request) {
		String ip = request.getRemoteAddr();
		boolean cert = certDao.validate(CertDto.builder().who(ip).secret(secret).build());
		return cert;
	}
}
