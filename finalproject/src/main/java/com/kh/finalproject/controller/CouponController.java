package com.kh.finalproject.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.CouponDto;
import com.kh.finalproject.entity.CouponReqDto;
import com.kh.finalproject.entity.LocalDto;
import com.kh.finalproject.repository.BranchDao;
import com.kh.finalproject.repository.CouponDao;
import com.kh.finalproject.repository.CouponReqDao;
import com.kh.finalproject.repository.LocalDao;
import com.kh.finalproject.service.CouponReqService;
import com.kh.finalproject.service.CouponService;

@Controller
@RequestMapping("/admin/coupon")
public class CouponController {

	@Autowired
	private LocalDao localDao;
	
	@Autowired
	private BranchDao branchDao;
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private CouponDao couponDao;
	
	@Autowired
	private CouponReqService couponReqService;
	
	@Autowired
	private CouponReqDao couponReqDao;
	
	@GetMapping("/regist")
	public String regist(Model model) {
		// 지역 목록 전달
		List<LocalDto> localList = localDao.getList();
		model.addAttribute("localList", localList);
		
		// 지점 목록 전달
		List<BranchDto> branchList = branchDao.getList();
		model.addAttribute("branchList", branchList);		
		
		return "admin/coupon/regist";
	}
	
	@PostMapping("/regist")
	public String regist(@RequestParam(required = false, defaultValue = "0") int[] branch_no, 
			@RequestParam(required = false, defaultValue = "0") int[] local_no, @ModelAttribute CouponDto couponDto) {
		couponService.regist(branch_no, local_no, couponDto);
		
		return "redirect:regist";
	}
	
	@GetMapping("/list")
	public String getList(Model model, @RequestParam(required = false, defaultValue = "0") int branch_no, 
			@RequestParam(required = false, defaultValue = "all") String order
			) {
		// 지점 목록 전달
		List<BranchDto> branchList = branchDao.getList();
		model.addAttribute("branchList", branchList);
		List<CouponDto> couponList = new ArrayList<CouponDto>();
		// 전체대상/지점별 쿠폰 목록 전달
		if(branch_no != 0) { // 지점일 경우			
			couponList = couponService.getList(branch_no, order);
		} else { // 전체일 경우
			couponList = couponService.getList(order);
		}
		model.addAttribute("couponList", couponList);
		
		return "admin/coupon/list";
	}
	
	@GetMapping("/delete/{group_no}")
	public String delete(@PathVariable int group_no, Model model, @RequestParam(required = false, defaultValue = "all") String order) {
		
		couponDao.delete(group_no);
	
		// 쿠폰 목록 전달
		List<CouponDto> couponList = couponDao.getCouponList(order);
		model.addAttribute("couponList", couponList);

		return "redirect:/admin/coupon/edit";
	}
	
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam(required = false, defaultValue = "all") String order) {
		
		// 전체대상/지점별 쿠폰 목록 전달
		List<CouponDto> couponList = couponDao.getCouponList(order);
		model.addAttribute("couponList", couponList);
		
		return "admin/coupon/edit";
	}
	
	@GetMapping("/req/regist")
	public String request(Model model, @RequestParam(required = false, defaultValue = "all") String order,
			HttpSession session) {
		// 지점번호 꺼내기
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		int branch_no = adminDto.getBranch_no();
		
		// 요청 진행목록 전달
		List<CouponReqDto> list = couponReqService.getList(branch_no, order);
		model.addAttribute("list", list);
		
		return "admin/coupon/req/regist";
	}
	
	@PostMapping("/req/regist")
	public String request(Model model, @RequestParam(required = false, defaultValue = "all") String order
			, HttpSession session, @ModelAttribute CouponReqDto couponReqDto) {
		
		// 지점번호 꺼내기
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		int branch_no = adminDto.getBranch_no();

		// 쿠폰 요청 등록
		couponReqDto.setBranch_no(branch_no);
		couponReqDao.regist(couponReqDto);
		
		// 요청 진행목록 전달
		List<CouponReqDto> list = couponReqService.getList(branch_no, order);
		model.addAttribute("list", list);
		return "redirect:regist";
	}
	
	@GetMapping("/req/list")
	public String req_list(Model model, @RequestParam(required = false, defaultValue = "0") int branch_no, 
			@RequestParam(required = false, defaultValue = "all") String order) {
		// 지점 목록 전달
		List<BranchDto> branchList = branchDao.getList();
		model.addAttribute("branchList", branchList);
		
		// 요청 진행목록 전달
		List<CouponReqDto> list = couponReqService.getList2(branch_no, order);
		model.addAttribute("list", list);
		
		return "admin/coupon/req/list";
	}
	
	@GetMapping("/req/edit")
	public String edit(Model model, HttpSession session, @RequestParam(required = false, defaultValue = "0") int coupon_req_no) {
		// 지점번호 꺼내기
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		int branch_no = adminDto.getBranch_no();
		
		// 요청 대기 목록 전달
		List<CouponReqDto> list = couponReqDao.waitList(branch_no);
		model.addAttribute("list", list);
		
		// 파라미터가 있는 경우
		if(coupon_req_no != 0) {
			CouponReqDto couponReqDto = couponReqDao.get(coupon_req_no);
			model.addAttribute("couponReqDto", couponReqDto);			
		}
		
		return "admin/coupon/req/edit";
	}
	
	@PostMapping("/req/edit")
	public String edit(Model model, HttpSession session, @ModelAttribute CouponReqDto couponReqDto) {
		// 요청 수정
		couponReqDao.edit(couponReqDto);
		model.addAttribute("couponReqDto", couponReqDto);
		
		// 지점번호 꺼내기
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		int branch_no = adminDto.getBranch_no();
		
		// 요청 대기 목록 전달
		List<CouponReqDto> list = couponReqDao.waitList(branch_no);
		model.addAttribute("list", list);
		
		
		return "redirect:edit";
	}
}
