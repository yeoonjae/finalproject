package com.kh.finalproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalproject.entity.LocalDto;
import com.kh.finalproject.repository.LocalDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/branch")
public class LocalController {

	@Autowired
	private LocalDao localDao;
	
	@GetMapping("/local_regist")
	public String regist(Model model) {
		List<LocalDto> list = localDao.getList();
		model.addAttribute("list", list);
		return "admin/branch/local_regist";
	}
	
	//지역 등록
	@PostMapping("/local_regist")
	public String regist(Model model, @RequestParam String local_name) {
		localDao.regist(local_name);
		List<LocalDto> list = localDao.getList();
		model.addAttribute("list", list);
		return "redirect:local_regist";
	}
	
	//지역 삭제
	@GetMapping("/local_delete")
	public String delete(@RequestParam int local_no) {
		localDao.delete(local_no);
		return "redirect:local_regist";
	}
	
	
}
