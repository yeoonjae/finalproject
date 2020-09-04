package com.kh.finalproject.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.entity.PointHisDto;
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
	
	// 기간 조회
	@GetMapping("/date")
	public Map<String, Object> getDate(@RequestParam int date) {
		String start = sqlSession.selectOne("pointHis.getDate", date);
		String finish = sqlSession.selectOne("pointHis.sysdate");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("finish", finish);
		
		return map;
	}
	
	@GetMapping("/point/list")
	public List<PointHisDto> getList(@RequestParam int member_no, @RequestParam String start, @RequestParam String finish) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_no", member_no);
		map.put("start", start);
		map.put("finish", finish);
		
		return sqlSession.selectList("pointHis.getList", map);
	}
}
