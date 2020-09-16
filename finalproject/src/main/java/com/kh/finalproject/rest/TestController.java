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

import com.kh.finalproject.entity.AdminDto;
import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.CouponDto;
import com.kh.finalproject.entity.CouponReqDto;
import com.kh.finalproject.entity.LocalDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.entity.PointHisDto;
import com.kh.finalproject.repository.CouponDao;
import com.kh.finalproject.service.MemberService;

@RestController
@RequestMapping("/test")
public class TestController {
	@Autowired
	private SqlSession sqlSession;

	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CouponDao couponDao;
	
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
	
	@GetMapping("/coupon/branchList")
	public List<BranchDto> getBranchList(@RequestParam int group_no) {
		return sqlSession.selectList("coupon.getBranchList", group_no);
	}
	
	@GetMapping("/coupon/edit")
	public void edit(@RequestParam int group_no, @RequestParam String coupon_name,
			@RequestParam int coupon_discount, @RequestParam String coupon_start, @RequestParam String coupon_finish) {
		CouponDto couponDto = CouponDto.builder()
										.group_no(group_no)
										.coupon_name(coupon_name)
										.coupon_discount(coupon_discount)
										.coupon_start(coupon_start)
										.coupon_finish(coupon_finish)
									.build();
		sqlSession.update("coupon.edit", couponDto);
	}
	
	@GetMapping("/coupon/delete")
	public void delete(@RequestParam int branch_no, @RequestParam int group_no) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("branch_no", branch_no);
		param.put("group_no", group_no);
		sqlSession.delete("coupon.branchDelete", param);
	}
	
	// 쿠폰 요청 승인
	@GetMapping("/coupon/req/approval")
	public void approval(@RequestParam int coupon_req_no) {
		// 요청 테이블 승인으로 수정
		sqlSession.update("couponReq.approval", coupon_req_no);
		
		// 그룹번호 시퀀스 가져오기
		int group_no = couponDao.getGroupSeq();
		
		// 쿠폰 요청 정보 가져와서 쿠폰 dto에 설정
		CouponReqDto reqDto = sqlSession.selectOne("couponReq.get", coupon_req_no);
		CouponDto couponDto = CouponDto.builder()
								.branch_no(reqDto.getBranch_no())
								.admin_no(reqDto.getAdmin_no())
								.coupon_name(reqDto.getCoupon_req_name())
								.coupon_discount(reqDto.getCoupon_req_discount())
								.coupon_start(reqDto.getCoupon_req_start())
								.coupon_finish(reqDto.getCoupon_req_finish())
								.group_no(group_no)
								.build();
		// 쿠폰 테이블에 등록하기
		sqlSession.insert("coupon.registB", couponDto);
		
	}
	
	// 쿠폰 요청 거절
	@GetMapping("/coupon/req/refuse")
	public void refuse(@RequestParam int coupon_req_no, String coupon_req_detail) {
		// 요청 테이블 거절로 수정
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("coupon_req_no", coupon_req_no);
		param.put("coupon_req_detail", coupon_req_detail);
		sqlSession.update("couponReq.refuse", param);
	}
	
	// 쿠폰 요청 삭제
	@GetMapping("/coupon/req/delete")
	public void delete(@RequestParam int coupon_req_no) {
		sqlSession.delete("couponReq.delete", coupon_req_no);
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
