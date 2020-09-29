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
	
	// 지점에서 좌석 등록
	@GetMapping("/branch/regist")
	public String regist(HttpSession session, Model model) {
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		int branch_no = adminDto.getBranch_no();
		model.addAttribute("branch_no", branch_no);
		return "admin/seat/regist";
	}
	
	// 지점에서 좌석 등록
	@PostMapping("/branch/regist")
	public String regist(@RequestParam String[] seat, @RequestParam String entrance_location, HttpSession session) {
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		int branch_no = adminDto.getBranch_no();
		// 좌석정보 등록
		seatService.regist(seat, branch_no, entrance_location);
		return "redirect:content";
	}

	/*
	 * // 본사에서 좌석 등록
	 * 
	 * @GetMapping("/regist") public String regist(Model model, @RequestParam int
	 * branch_no) { model.addAttribute("branch_no", branch_no); return
	 * "admin/seat/regist"; }
	 * 
	 * // 본사에서 좌석 등록
	 * 
	 * @PostMapping("/regist") public String regist(@RequestParam String[]
	 * seat, @RequestParam int branch_no , @RequestParam String entrance_location,
	 * RedirectAttributes attr) { // 좌석정보 등록 seatService.regist(seat, branch_no,
	 * entrance_location); attr.addAttribute("branch_no", branch_no); return
	 * "redirect:detail"; }
	 */
	
	// 지점 상세보기 페이지
	@GetMapping("/branch/content")
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
		
		return "admin/seat/branch/content";
	}
	
	// 본사 상세보기 페이지
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
	
	@GetMapping("/branch/delete")
	public String delete(RedirectAttributes attr, HttpSession session) {
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		int branch_no = adminDto.getBranch_no();
		seatDao.delete(branch_no);
		attr.addAttribute("branch_no", branch_no);
		return "redirect:regist";
	}
	
}
