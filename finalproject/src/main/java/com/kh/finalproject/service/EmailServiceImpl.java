package com.kh.finalproject.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.finalproject.entity.AdminDto;
@Service
public class EmailServiceImpl implements EmailService {
	@Autowired
	private JavaMailSender sender;

	@Override
	public void sendSimpleMessage(SimpleMailMessage message) {
		sender.send(message);		
	}
	@Override
	public void sendSimpleMessage(String email, String title, String text) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setSubject(title);
		message.setText(text);
//		sender.send(message);
		this.sendSimpleMessage(message);
	}
	@Override
	public String documentation(AdminDto adminDto) {
		String id = adminDto.getAdmin_id();
		String pw = adminDto.getAdmin_pw();
		String name = adminDto.getAdmin_name();
		String text = "아이디 : "+id+"\n 비밀번호 : "+pw+"\n 이름 : "+name+"\n 즉시 관리자 계정의 이름과 비밀번호를 수정하시오";
		return text;
	}
	
}
