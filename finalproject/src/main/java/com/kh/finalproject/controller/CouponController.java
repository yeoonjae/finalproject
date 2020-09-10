package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.CouponDto;
import com.kh.finalproject.entity.LocalDto;
import com.kh.finalproject.repository.BranchDao;
import com.kh.finalproject.repository.CouponDao;
import com.kh.finalproject.repository.LocalDao;
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
			@RequestParam(required = false, defaultValue = "all") String order) {
		// 지점 목록 전달
		List<BranchDto> branchList = branchDao.getList();
		model.addAttribute("branchList", branchList);
		
		// 쿠폰 목록 전달
		List<CouponDto> couponList = couponService.getList(branch_no, order);
		model.addAttribute("couponList", couponList);
		
		return "admin/coupon/list";
	}
	
	@GetMapping("/delete/{coupon_no}")
	public String delete(@PathVariable int coupon_no, Model model, RedirectAttributes attr, @RequestParam(required = false, defaultValue = "0") int branch_no,
			@RequestParam(required = false, defaultValue = "all") String order) {
		couponDao.delete(coupon_no);
		
		// 지점 목록 전달
		List<BranchDto> branchList = branchDao.getList();
		model.addAttribute("branchList", branchList);
		
		// 쿠폰 목록 전달
		List<CouponDto> couponList = couponService.getList(branch_no, order);
		model.addAttribute("couponList", couponList);
		
		// 지점 번호 전달
		if(branch_no!=0) {			
			attr.addAttribute("branch_no", branch_no);
		}
		if(order.equals("all")) {
			attr.addAttribute("order", order);
		}
		return "redirect:/admin/coupon/list";
	}
	
}
