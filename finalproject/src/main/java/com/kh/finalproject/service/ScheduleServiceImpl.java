package com.kh.finalproject.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.finalproject.entity.CouponDto;
import com.kh.finalproject.entity.MemberCouponDto;
import com.kh.finalproject.repository.CouponDao;
import com.kh.finalproject.repository.CouponReqDao;
import com.kh.finalproject.repository.MemberCouponDao;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	private CouponDao couponDao;
	
	@Autowired
	private CouponReqDao couponReqDao;
	
	@Autowired
	private MemberCouponDao memberCouponDao;
	
	// 매일 자정마다 시작일이 오늘인 쿠폰을 회원쿠폰함에 등록
	@Scheduled(cron="0 0 0 * * *") // 매일 자정마다
	@Override
	public void regist() {
		// 시작일이 오늘인 쿠폰 조회
		List<CouponDto> couponList = couponDao.todayStart();
		
		// 회원 쿠폰 내역 테이블에 등록
		MemberCouponDto memberCouponDto;
		for(int i=0; i<couponList.size(); i++) {
			memberCouponDto = MemberCouponDto.builder()
								.coupon_no(couponList.get(i).getCoupon_no())
								.branch_no(couponList.get(i).getBranch_no())
								.member_no(couponList.get(i).getMember_no())
								.build();
			memberCouponDao.regist(memberCouponDto);
		}
		
	}

	// 매일 23시 59분마다 종료일이 오늘인 쿠폰을 회원쿠폰함에서 삭제
	@Scheduled(cron="0 59 23 * * *") // 매일 23:59 마다
	@Override
	public void delete() {
		// 종료일이 오늘인 쿠폰 조회
		List<CouponDto> couponList = couponDao.todayFinish();
		
		// 쿠폰 내역에서 삭제
		for(int i=0; i<couponList.size(); i++) {
			int coupon_no = couponList.get(i).getCoupon_no();
			memberCouponDao.delete(coupon_no);
		}
		
	}

	@Scheduled(cron="0 58 23 * * *") // 매일 23:58 마다
	@Override
	public void changeState() {
		// 시작일이 내일인 대기중인 쿠폰요청 조회
		List<Integer> noList = couponReqDao.changeStateList();
		
		// 해당 쿠폰 '거절'로 변경
		for(int i=0; i<noList.size(); i++) {
			int coupon_req_no = noList.get(i);
			couponReqDao.changeState(coupon_req_no);
		}
		
	}

	@Autowired
	private SqlSession sqlSession;
	
	//매일 자정마다 연결테이블에 없는 메세지들 삭제
	@Scheduled(cron = "0 0 0 * * *")//매일 자정마다
	public void messageAutoDelete() {
		sqlSession.delete("message.messageAutoDelete");
	}

	// 만료날짜가 현재를 지난 지점 삭제 (매일 자정마다)
	@Scheduled(cron = "0 0 0 * * *")
	public void branchDelete() {
		sqlSession.delete("branch.delete");
	}
	
	//finish_date가 지난 것을 '삭제완료'로 변경
	@Scheduled(cron = "0 0 0 * * *")
	public void branchDeleteListUpdate() {
		sqlSession.update("branch.updateStatus");
	}

}
