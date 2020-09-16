package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.SeatDto;
import com.kh.finalproject.repository.SeatDao;
import com.kh.finalproject.service.SeatService;

@Controller
@RequestMapping("/admin/seat")
public class SeatController {

	@Autowired
	private SeatService seatService;
	
	@Autowired
	private SeatDao seatDao;
	
	@GetMapping("/regist")
	public String regist() {
		return "admin/seat/regist";
	}
	
	@PostMapping("/regist")
	public String regist(@RequestParam String[] seat, HttpSession session) {
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		int branch_no = adminDto.getBranch_no();
		seatService.regist(seat, branch_no);
		return "admin/seat/regist";
	}
	
	@GetMapping("/content")
	public String content(@RequestParam int branch_no, Model model) {
		List<SeatDto> list = seatDao.getList(branch_no);
		
		int row = seatDao.getRow(branch_no);
		int col = seatDao.getCol(branch_no);
		
		model.addAttribute("list", list);
		model.addAttribute("rowsize", row);
		model.addAttribute("colsize", col);
		
		return "admin/seat/content";
	}
}
