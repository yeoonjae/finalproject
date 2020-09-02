package com.kh.finalproject.rest;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.service.MemberService;

@RestController
@RequestMapping("/test")
public class TestController {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private MemberService memberService;
	
	// 마일리지 유형 중복검사
	@GetMapping("/point/regist")
	public PointDto regist(@RequestParam String point_detail) {
		return sqlSession.selectOne("point.getDetail", point_detail);
	}
	
	// 회원 검색
	@GetMapping("/member/search")
	public List<MemberDto> search(@RequestParam String member_name, @RequestParam int branch_no) {
		return memberService.search(member_name, branch_no);
	}
}
