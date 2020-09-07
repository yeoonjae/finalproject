package com.kh.finalproject.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.annotation.JsonAppend.Attr;
import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.repository.AdminDao;
import com.kh.finalproject.service.EmailService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@RequestMapping("/")//첫 주소
	public String root() {
		return "admin/admin_index";
	}
}
