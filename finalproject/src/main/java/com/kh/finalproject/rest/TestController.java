package com.kh.finalproject.rest;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.entity.PointHisDto;

@RestController
@RequestMapping("/test")
public class TestController {
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/point/regist")
	public PointDto regist(@RequestParam String point_detail) {
		return sqlSession.selectOne("point.getDetail", point_detail);
	}
	
	@GetMapping("/point/list")
	public List<PointDto> getList() {
		return sqlSession.selectList("point.getList");
	}
	
	@GetMapping("/point/get")
	public PointDto get(@RequestParam int point_no) {
		return sqlSession.selectOne("point.get", point_no);
	}
	
	@GetMapping("/member/list")
	public MemberDto getMemberList(@RequestParam int member_no) {
		return sqlSession.selectOne("member.get", member_no);
	}
	
}
