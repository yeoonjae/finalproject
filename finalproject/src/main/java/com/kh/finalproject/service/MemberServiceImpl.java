package com.kh.finalproject.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.finalproject.entity.MemberDto;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private PasswordEncoder encoder;
	//비밀번호 암호화 매치 확인
	@Override
	public boolean check(String pw, HttpSession session) {
		MemberDto find = (MemberDto) session.getAttribute("memberinfo");
		return encoder.matches(pw, find.getMember_pw());
	}

}
