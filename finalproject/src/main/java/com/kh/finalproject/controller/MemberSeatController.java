package com.kh.finalproject.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.LicenseHisDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.SeatDto;
import com.kh.finalproject.repository.LicenseHisDao;
import com.kh.finalproject.repository.SeatDao;
import com.kh.finalproject.service.SeatService;

@Controller
@RequestMapping("/member/seat")
public class MemberSeatController {

	@Autowired
	private SeatService seatService;
	
	@Autowired
	private SeatDao seatDao;
	
	@Autowired
	private LicenseHisDao licenseHisDao;
	
	@GetMapping("/select")
	public String select(Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto)session.getAttribute("memberinfo");
		int branch_no = memberDto.getBranch_no();
		
		List<SeatDto> list = seatDao.getList(branch_no);
		
		int row = seatDao.getRow(branch_no);
		int col = seatDao.getCol(branch_no);
		String entrance = seatDao.getEntrance(branch_no);
		
		int member_no = memberDto.getMember_no();
		LicenseHisDto isUsed = licenseHisDao.getUsed(member_no);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(isUsed != null) { // 이용중이면
			map.put("usedCol", isUsed.getSeat_col());
			map.put("usedRow", isUsed.getSeat_row());
			model.addAttribute("used", map);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("rowsize", row);
		model.addAttribute("colsize", col);
		model.addAttribute("entrance", entrance);
		model.addAttribute("memberDto", memberDto);
		
		return "member/seat/select";
	}
	
}
