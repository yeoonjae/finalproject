package com.kh.finalproject.controller;

import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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


import com.kh.finalproject.entity.LicenseDto;
import com.kh.finalproject.entity.MemberBranchDto;
import com.kh.finalproject.entity.MemberCouponDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PayInfoDto;
import com.kh.finalproject.entity.PayServeDto;
import com.kh.finalproject.repository.LicenseDao;
import com.kh.finalproject.repository.LicenseHisDao;
import com.kh.finalproject.repository.PayDao;

@Controller
@RequestMapping("/member/pay")
public class PayController {
	
	@Autowired
	private LicenseDao licenseDao;
	
	@Autowired
	private LicenseHisDao licenseHisDao;
	
	@Autowired
	private PayDao payDao;

	
	@GetMapping("/pay_main")
	public String getBranch(Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("memberinfo"); 
		int member_no = memberDto.getMember_no();
		
		// 이용권 리스트 가져오기 
		List<LicenseDto> list = licenseDao.getList();
		model.addAttribute("list", list);
		
		// 회원 지점명 가져오기 
		MemberBranchDto memberBranchDto = payDao.getBranch(member_no);
		model.addAttribute("memberBranchDto",memberBranchDto);
		
		List<MemberCouponDto> list2 = payDao.coupon_getList(member_no);
		model.addAttribute("list2", list2);	
		
		return "member/pay/pay_main";
	}
	
	@RequestMapping("/pay_detail")
	public String getPayIist(Model model, HttpSession session) {
		
		MemberDto memberDto = (MemberDto) session.getAttribute("memberinfo"); 
		int member_no = memberDto.getMember_no();
		
		List<PayInfoDto> list = payDao.getPayInfo(member_no); 		
		model.addAttribute("list", list);
		
		return "member/pay/pay_detail";
	}
	
	@GetMapping("/pay_serve")
	public String getPayList(Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("memberinfo"); 
		int member_no = memberDto.getMember_no();
		
		// 필요한 정보 전달
		PayServeDto payServeDto = licenseHisDao.getPayInfo(member_no);
		int license_his_no = payServeDto.getLicense_his_no();
		int overTime = licenseHisDao.useTime(license_his_no);
		model.addAttribute("payServeDto", payServeDto);
		model.addAttribute("overTime", overTime);
		return "member/pay/pay_serve";
	}
	
//	@GetMapping("/list")
//	public String getList(Model model, HttpSession session){
//		MemberDto memberDto = (MemberDto)session.getAttribute("memberinfo");
//		int member_no = memberDto.getMember_no();
//
//		Calendar cal = Calendar.getInstance();
//        cal.setTime(new Date());
//        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//        String finish = df.format(cal.getTime());
//
//        cal.add(Calendar.DATE, -7);
//        String start = df.format(cal.getTime());
//
//		Map<String, Object> param = new HashMap<String, Object>();
//		param.put("member_no", member_no);
//		param.put("start", start);
//		param.put("finish", finish);
//		List<PayInfoDto> list = PayInfoDto.getList(param);
//
//		model.addAttribute("list", list);
//		model.addAttribute("start", start);
//		model.addAttribute("finish", finish);
//
//		return "member/point/list";
//	}
//
//	@PostMapping("/list")
//	public String getList(Model model, HttpSession session, @RequestParam String start, @RequestParam String finish) {
//		MemberDto memberDto = (MemberDto)session.getAttribute("memberinfo");
//		int member_no = memberDto.getMember_no();
//
//		Map<String, Object> param = new HashMap<String, Object>();
//		param.put("member_no", member_no);
//		param.put("start", start);
//		param.put("finish", finish);
//		List<PayInfoDto> list = PayInfoDto.getList(param);
//
//		model.addAttribute("list", list);
//		model.addAttribute("start", start);
//		model.addAttribute("finish", finish);
//
//		return "member/point/list";
//	}
	
}
