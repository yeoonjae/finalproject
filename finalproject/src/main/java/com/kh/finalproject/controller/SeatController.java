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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.SeatDto;
import com.kh.finalproject.repository.BranchDao;
import com.kh.finalproject.repository.SeatDao;
import com.kh.finalproject.service.SeatService;

@Controller
@RequestMapping("/admin/seat")
public class SeatController {

	@Autowired
	private SeatService seatService;
	
	@Autowired
	private SeatDao seatDao;
	
	@Autowired
	private BranchDao branchDao;
	
	@GetMapping("/regist")
	public String regist(HttpSession session, Model model) {
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		int branch_no = adminDto.getBranch_no();
		model.addAttribute("branch_no", branch_no);
		return "admin/seat/regist";
	}
	
	@PostMapping("/regist")
	public String regist(@RequestParam String[] seat, @RequestParam String entrance_location, HttpSession session, RedirectAttributes attr) {
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		int branch_no = adminDto.getBranch_no();
		// 좌석정보 등록
		seatService.regist(seat, branch_no, entrance_location);
		//return "admin/seat/regist";
		attr.addAttribute("branch_no", branch_no);
		return "redirect:content";
	}
	
	@GetMapping("/content")
	public String content(Model model, HttpSession session) {
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		int branch_no = adminDto.getBranch_no();
		
		String branch_name = branchDao.getName(branch_no);
		
		List<SeatDto> list = seatDao.getList(branch_no);
		
		int row = seatDao.getRow(branch_no);
		int col = seatDao.getCol(branch_no);
		String entrance = seatDao.getEntrance(branch_no);
		
		model.addAttribute("list", list);
		model.addAttribute("rowsize", row);
		model.addAttribute("colsize", col);
		model.addAttribute("entrance", entrance);
		model.addAttribute("branch_name", branch_name);
		
		return "admin/seat/content";
	}
	
	@GetMapping("/detail")
	public String detail(@RequestParam int branch_no, Model model) {
		String branch_name = branchDao.getName(branch_no);
		
		List<SeatDto> list = seatDao.getList(branch_no);
		
		int row = seatDao.getRow(branch_no);
		int col = seatDao.getCol(branch_no);
		String entrance = seatDao.getEntrance(branch_no);
		
		model.addAttribute("list", list);
		model.addAttribute("rowsize", row);
		model.addAttribute("colsize", col);
		model.addAttribute("entrance", entrance);
		model.addAttribute("branch_name", branch_name);
		
		return "admin/seat/detail";
	}
	
}
