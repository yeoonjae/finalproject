package com.kh.finalproject.rest;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.LocalDto;
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
	
	@GetMapping("/branch/branch_name")
	public BranchDto branchName(@RequestParam String branch_name) {
		return sqlSession.selectOne("branch.getName", branch_name);
	}
	
	@GetMapping("/branch/local_name")
	public LocalDto localName(@RequestParam String local_name) {
		return sqlSession.selectOne("local.get", local_name);
	}
	
	//지역 내 지점 확인
	@GetMapping("/branch/local_check")
	public boolean check(@RequestParam int local_no) {
		List<LocalDto> list = sqlSession.selectList("local.isHaveBranch", local_no);
		if(!list.isEmpty()) {//검색했는데 비어있지 않으면 지역에 해당된 지점이 존재
			System.out.println(list.isEmpty());
			return false;
		}
		return true;
	}
	
	//지역 검색
	@GetMapping("/message/localList")
	public List<LocalDto> localList(){
		return sqlSession.selectList("local.getList");
	}
	
	//지점 검색
	@GetMapping("/message/branchList")
	public List<BranchDto> branchList(@RequestParam int local_no){
		return sqlSession.selectList("branch.localBranchList",local_no);
	}
	
	//지점 관리자 정보
	@GetMapping("/message/adminInfo")
	public AdminDto adminInfo(@RequestParam int admin_no) {
		return sqlSession.selectOne("admin.getAdminInfo", admin_no);
	}
	
	//전체회원
	@GetMapping("/message/memberList")
	public List<MemberDto> memberList(){
		return sqlSession.selectList("member.getList");
	}
	
	//모든 지점관리자
	@GetMapping("/message/branchAdmin")
	public List<AdminDto> branchAdmin(){
		return sqlSession.selectList("admin.getBranchAdmin");
	}
	
}
