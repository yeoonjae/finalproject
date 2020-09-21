package com.kh.finalproject.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PointHisDto;
import com.kh.finalproject.repository.PointHisDao;

@Controller
@RequestMapping("/member/point")
public class MemberPointController {

	@Autowired
	private PointHisDao pointHisDao;
	
	@GetMapping("/list")
	public String getList(Model model, HttpSession session){
		MemberDto memberDto = (MemberDto)session.getAttribute("memberinfo");
		int member_no = memberDto.getMember_no();
		
		Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String finish = df.format(cal.getTime());

        cal.add(Calendar.DATE, -7);
        String start = df.format(cal.getTime());
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_no", member_no);
		param.put("start", start);
		param.put("finish", finish);
		List<PointHisDto> list = pointHisDao.getList(param);
		
		model.addAttribute("list", list);
		model.addAttribute("start", start);
		model.addAttribute("finish", finish);
		
		return "member/point/list";
	}
	
	@PostMapping("/list")
	public String getList(Model model, HttpSession session, @RequestParam String start, @RequestParam String finish) {
		MemberDto memberDto = (MemberDto)session.getAttribute("memberinfo");
		int member_no = memberDto.getMember_no();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_no", member_no);
		param.put("start", start);
		param.put("finish", finish);
		List<PointHisDto> list = pointHisDao.getList(param);
		
		model.addAttribute("list", list);
		model.addAttribute("start", start);
		model.addAttribute("finish", finish);
		
		return "member/point/list";
	}
}
