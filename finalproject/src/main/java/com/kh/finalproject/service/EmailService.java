package com.kh.finalproject.service;

import org.springframework.mail.SimpleMailMessage;

import com.kh.finalproject.entity.AdminDto;


public interface EmailService {
	void sendSimpleMessage(SimpleMailMessage message);
	void sendSimpleMessage(String email, String title, String text);
	String documentation(AdminDto adminDto);
}
