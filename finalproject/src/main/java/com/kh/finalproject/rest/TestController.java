package com.kh.finalproject.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.kh.finalproject.entity.InoutDto;
import com.kh.finalproject.entity.LicenseHisDto;
import com.kh.finalproject.entity.LocalDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PointDto;
import com.kh.finalproject.entity.PointHisDto;
import com.kh.finalproject.entity.SeatDto;
import com.kh.finalproject.repository.CouponDao;
import com.kh.finalproject.repository.InoutDao;
import com.kh.finalproject.repository.LicenseHisDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.SeatDao;
import com.kh.finalproject.service.MemberService;

@RestController
@RequestMapping("/test")
public class TestController {
	@Autowired
	private SqlSession sqlSession;

	@Autowired
	private LicenseHisDao licenseHisDao;
	
	@Autowired
	private InoutDao inoutDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CouponDao couponDao;
	
	@Autowired
	private SeatDao seatDao;
	
	@Autowired
	private HttpSession session;
	
	
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
	
	@GetMapping("/seat/check")
	public boolean checkSeat(@RequestParam int branch_no, @RequestParam int row, @RequestParam int col, @RequestParam int member_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("branch_no", branch_no);
		map.put("seat_row", row);
		map.put("seat_col", col);
		SeatDto seatDto = sqlSession.selectOne("seat.check", map);
		int check = seatDto.getSeat_state();
		int seat_no = seatDto.getSeat_no();
		if(check==1) { // 이용 가능일 경우
			// 이용 내역 테이블에 정보 업데이트
			LicenseHisDto licenseHisDto = LicenseHisDto.builder()
											.seat_no(seat_no)
											.member_no(member_no)
												.build();
			licenseHisDao.registStart(licenseHisDto);
			
			// 입퇴실 테이블에 입실 내역 추가
			InoutDto inoutDto = InoutDto.builder()
									.member_no(member_no)
									.branch_no(branch_no)
										.build();
			inoutDao.registIn(inoutDto);
			
			// 이용 불가로 변경
			seatDao.used(seat_no);
			return true;
		} else { // 이용 불가일 경우
			return false;
		}
	}
	
	@GetMapping("/seat/out")
	public int out(@RequestParam int member_no, @RequestParam int branch_no) {
		// 이용내역 정보 가져오기
		LicenseHisDto licenseHisDto = licenseHisDao.getUsed(member_no);
		int license_his_no = licenseHisDto.getLicense_his_no();
		int seat_no = licenseHisDto.getSeat_no();
		
		// 이용내역 테이블 종료시간 업데이트
		licenseHisDao.updateFinish(license_his_no);
		
		// 입퇴실 테이블 퇴실내역 업데이트
		InoutDto inoutDto = InoutDto.builder()
								.member_no(member_no)
								.branch_no(branch_no)
									.build();
		inoutDao.registOut(inoutDto);
		
		// 좌석 이용가능으로 변경
		seatDao.notUsed(seat_no);
		
		// 이용시간 계산 후 충전시간과 비교
		int charge = memberDao.getCharge(member_no); // 충전시간
		int useTime = licenseHisDao.useTime(license_his_no); // 이용시간
		
		// 충전시간이 남아있는 경우
		if(charge > useTime) {
			
			int timeUnit = 10;
			int minusTime = ((useTime+timeUnit-1)/timeUnit)*timeUnit; // 10분 기준으로 차감
			System.out.println("차감 시간 : "+minusTime);
			int member_charge = charge - minusTime; // 잔여시간 구하기
			// 충전시간 업데이트
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("member_no", member_no);
			param.put("member_charge", member_charge);
			memberDao.changeCharge(param);
			
			return 0;
			
		// 충전시간이 부족하거나 이용시간과 같은 경우
		} else {
			int timeUnit = 30; // 30분
			int overTime = (useTime - charge + timeUnit - 1) / timeUnit;
			int halfCharge = 1000; // 기준 금액(30분에 1000원씩)
			System.out.println("초과 시간 : "+overTime);
			int price = overTime * halfCharge; // 결제 금액
			System.out.println("금액 : "+price);
			
			// 충전시간 업데이트
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("member_no", member_no);
			param.put("member_charge", 0);
			memberDao.changeCharge(param);
			
			// 결제금액이 있는경우 업데이트
			if(price!=0) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("license_his_pay", price);
				map.put("license_his_no", license_his_no);
				licenseHisDao.updatePay(map);
				
				return license_his_no;
				
			} else { // 결제 금액이 없는 경우
				return 0;
			}
			
		}
		
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
	
	//관리자번호로 지점 --> 지점에 속한 회원들 읽어오기
	@GetMapping("/message/member")
	public List<MemberDto> memberBranchList(@RequestParam int admin_no){
		int branch_no = sqlSession.selectOne("branch.getBranch", admin_no);
		return sqlSession.selectList("member.getBranchList", branch_no);
	}
	
	//회원번호로 정보+지점정보까지 읽어오기
	@GetMapping("/message/memberInfo")
	public MemberDto memberBranchInfo(@RequestParam int member_no) {
		return sqlSession.selectOne("member.get", member_no);
	}
	
	//쪽지 조회수(지점장)
	@GetMapping("/message/update")
	public void updateRead(@RequestParam int message_manager_no) {
		sqlSession.update("message.updateManagerRead", message_manager_no);
	}
	
	//쪽지 조회수(회원)
	@GetMapping("/message/memberUpdate")
	public void updateReadMember(@RequestParam int message_member_no) {
		sqlSession.update("message.updateMemberRead", message_member_no);
	}
	
	//쪽지 span
	@GetMapping("/message/count")
	public int count() {
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		int admin_no = adminDto.getAdmin_no();
		int a = sqlSession.selectOne("message.managerReadCount", admin_no);
		return a;
	}
	
	//회원 안읽은 쪽지 개수
	@GetMapping("/message/count_member")
	public int countMember() {
		MemberDto memberDto = (MemberDto)session.getAttribute("memberinfo");
		int member_no = memberDto.getMember_no();
		return sqlSession.selectOne("message.memberReadCount", member_no);
	}

	@GetMapping("/notice/content")
	public String content(@RequestParam int notice_no) {
		return sqlSession.selectOne("notice.contentOnly", notice_no);
	}

}
