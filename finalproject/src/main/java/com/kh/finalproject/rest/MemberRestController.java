package com.kh.finalproject.rest;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.CertDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.BranchDao;
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
	@Autowired
	private BranchDao branchDao;
	//중복 확인
	@GetMapping("/overlap")
	public	Object overlap(@RequestParam String member_email) {
		int member_no =(int) memberDao.overlap(member_email);
		if(member_no == 0) {
			return null;
		}
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
	public Object certEmail(@RequestParam String secret, HttpServletRequest request) {
		String ip = request.getRemoteAddr();
		boolean cert = certDao.validate(CertDto.builder().who(ip).secret(secret).build());
		if(cert==false) {
			return null;
		}
		return cert;
	}
	//지역-지점 선택
	@GetMapping("/select_local")
	public List<BranchDto> selectLocal(@RequestParam int local_no){
		List<BranchDto> list = branchDao.selectLocal(local_no);
		return list;
	}
}
