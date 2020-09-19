package com.kh.finalproject.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.repository.MemberDao;

@RestController
@RequestMapping("member_rest")
public class MemberRestController {
	@Autowired
	private MemberDao memberDao;
	@GetMapping("/overlap")
	public Object overlap(@RequestParam String member_email) {
		int no =(int) memberDao.overlap(member_email);
		if(no!=0) {
			return 1;
		}
		return null;
	}
}
