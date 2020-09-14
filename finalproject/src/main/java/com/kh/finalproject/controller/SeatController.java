package com.kh.finalproject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/member")
public class SeatController {
	
	@RequestMapping("/qrCheck")
	public String qrCheck(HttpSession session,Model model) {
		return "member/seat/qrCheck";
	}

}
