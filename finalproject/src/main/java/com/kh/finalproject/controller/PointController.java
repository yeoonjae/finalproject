package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.entity.PointHisDto;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.PointDao;
import com.kh.finalproject.service.PointHisService;

@Controller
@RequestMapping("/admin/point")
public class PointController {
	@Autowired
	private PointDao pointDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private PointHisService pointHisService;
	
	// 마일리지 등록 페이지 get
	@GetMapping("/regist")
	public String regist(Model model, @RequestParam(required = false, defaultValue = "all") String point_type) {
		// 마일리지 유형 목록 전달
		List<PointDto> list = pointDao.getList(point_type);
		model.addAttribute("list", list);
		return "admin/point/regist";
	}
	// 마일리지 등록 post
	@PostMapping("/regist")
	public String regist(Model model, @ModelAttribute PointDto pointDto, 
			@RequestParam(required = false, defaultValue = "all") String point_type) {
		// 마일리지 유형 목록 전달
		List<PointDto> list = pointDao.getList(point_type);
		model.addAttribute("list", list);
		
		// 마일리지 유형 등록
		pointDao.regist(pointDto);
		return "redirect:regist";
	}
	
	// 정렬 방식 선택했을 때 목록
	// 유형 등록 페이지의 마일리지 유형 목록
	@PostMapping("/list1")
	public String getList1(Model model, RedirectAttributes attr, @RequestParam(required = false, defaultValue = "all") String point_type
			,HttpServletRequest request) {
		// 목록 전달
		List<PointDto> list = pointDao.getList(point_type);
		model.addAttribute("list", list);
		// 파라미터 유지
		attr.addAttribute("point_type", point_type);
		return "redirect:regist";		
	}
	
	// 정렬 방식 선택했을 때 목록
	// 유형 수정 페이지의 마일리지 유형 목록
	@PostMapping("/list2")
	public String getList2(Model model, RedirectAttributes attr, @RequestParam(required = false, defaultValue = "all") String point_type
			,HttpServletRequest request) {
		// 목록 전달
		List<PointDto> list = pointDao.getList(point_type);
		model.addAttribute("list", list);
		attr.addAttribute("point_type", point_type);
		return "redirect:edit";		
	}
	
	// 마일리지 유형 수정 get
	@GetMapping("/edit")
	public String edit(@RequestParam(required = false, defaultValue = "0") int point_no, Model model,
			 @RequestParam(required = false, defaultValue = "all") String point_type) {
		// 마일리지 번호와 일치하는 데이터 전송
		PointDto pointDto = pointDao.get(point_no);
		model.addAttribute("pointDto", pointDto);
		
		// 마일리지 유형 목록 전달
		List<PointDto> list = pointDao.getList(point_type);
		model.addAttribute("list", list);
		
		return "admin/point/edit";
	}
	
	// 마일리지 유형 수정 post
	@PostMapping("/edit")
	public String edit(@ModelAttribute PointDto pointDto,
			 @RequestParam(required = false, defaultValue = "all") String point_type, Model model) {
		// 마일리지 유형 수정
		pointDao.edit(pointDto);
		// 마일리지 유형 목록 전달
		List<PointDto> list = pointDao.getList(point_type);
		model.addAttribute("list", list);
		
		return "redirect:/admin/point/edit";	
	}
	
	@GetMapping("/delete/{point_no}")
	public String delete(@PathVariable int point_no) {
		// 마일리지 번호와 일치하는 유형 삭제
		pointDao.delete(point_no);
		return "redirect:/admin/point/regist";
	}
	
	@GetMapping("/addRemove")
	public String addRemove(Model model) {
		List<MemberDto> list = memberDao.getList();
		model.addAttribute("list", list);
		return "admin/point/addRemove";
	}
	
	@PostMapping("/addRemove")
	public String addRemove(@ModelAttribute PointHisDto pointHisDto, Model model) {
		pointHisService.regist(pointHisDto);
		
		List<MemberDto> list = memberDao.getList();
		model.addAttribute("list", list);
		return "redirect:/admin/point/addRemove";
	}
	
}
