package com.kh.finalproject.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalproject.entity.MemberDto;

public interface MemberService {

	// 회원 검색
	List<MemberDto> search(@RequestParam String member_name, @RequestParam int branch_no);
}
