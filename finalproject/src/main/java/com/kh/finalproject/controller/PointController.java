package com.kh.finalproject.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.mail.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.repository.PointDao;

@Controller
@RequestMapping("/admin")
public class PointController {
	@Autowired
	private PointDao pointDao;
	
	@GetMapping("/point/regist")
	public String regist(Model model,RedirectAttributes attr, @RequestParam(required = false, defaultValue = "all") String point_type) {
		List<PointDto> list = pointDao.getList(point_type);
		model.addAttribute("list", list);
		return "admin/point/regist";
	}
	
	@PostMapping("/point/regist")
	public String regist(Model model, @ModelAttribute PointDto pointDto, 
			RedirectAttributes attr, @RequestParam(required = false, defaultValue = "all") String point_type) {
		List<PointDto> list = pointDao.getList(point_type);
		attr.addAttribute("point_type", point_type);
		model.addAttribute("list", list);
		pointDao.regist(pointDto);
		return "redirect:regist";
	}
	
	@PostMapping("/point/list")
	public String getList(Model model, RedirectAttributes attr, @RequestParam(required = false, defaultValue = "all") String point_type) {
		List<PointDto> list = pointDao.getList(point_type);
		model.addAttribute("list", list);
		attr.addAttribute("point_type", point_type);
		return "redirect:regist";		
	}
	
	@GetMapping("/point/edit/{point_no}")
	public String edit(@PathVariable int point_no, Model model) {
		PointDto pointDto = pointDao.get(point_no);
		model.addAttribute("pointDto", pointDto);
		return "admin/point/edit";
	}
	
	@PostMapping("/point/edit/{point_no}")
	public String edit(@ModelAttribute PointDto pointDto) {
		pointDao.edit(pointDto);
		return "redirect:/admin/point/regist";	
	}
	
	@GetMapping("/point/delete/{point_no}")
	public String delete(@PathVariable int point_no) {
		pointDao.delete(point_no);
		return "redirect:/admin/point/regist";
	}
}
