package com.kh.finalproject.controller;

import java.net.URISyntaxException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PayHisDto;
import com.kh.finalproject.entity.PayInfoDto;
import com.kh.finalproject.entity.PayPointDto;
import com.kh.finalproject.pay.KakaoPayDeleteVO;
import com.kh.finalproject.pay.KakaoPayFinishVO;
import com.kh.finalproject.pay.KakaoPayHistoryVO;
import com.kh.finalproject.pay.KakaoPayResultVO;
import com.kh.finalproject.pay.KakaoPayStartVO;
import com.kh.finalproject.repository.PayDao;
import com.kh.finalproject.service.KakaoPayService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member/pay")
@Slf4j
public class KakaoPayController {

	@Autowired
	private KakaoPayService kakaoPayService;
	@Autowired
	private PayDao payDao;

	
	// 결제 요청 
	@GetMapping("/prepare")
	public String prepare() {
		return "member/pay/prepare";
	}

	@PostMapping("/prepare")
	public String prepare(@RequestParam int license_time, //이용권 시간 
										@RequestParam int license_no, // 이용권 번호 
										@RequestParam int coupon_no, // 쿠폰 번호 
										@RequestParam int coupon_discount2, //쿠폰 할인 금액 
										@RequestParam int sale_price, //총 할인 금액
										@RequestParam int use_point2, //사용한 마일리지
										@RequestParam int reward, // 적립금
										@ModelAttribute KakaoPayStartVO startVO, 
										HttpSession session) throws URISyntaxException {
		MemberDto memberDto = (MemberDto) session.getAttribute("memberinfo"); 
		int member_no = memberDto.getMember_no();	
		
		String partner_user_id = payDao.getId(member_no); // 회원 번호로 id가져오기
		String partner_order_id = Integer.toString(payDao.getOrderSeq()); // 시퀀스 번호 생성하여 부여 
		
		startVO.setPartner_order_id(partner_order_id);
		startVO.setPartner_user_id(partner_user_id);

		// 결제 요청 전 확인 
		boolean isCorrect = kakaoPayService.isCorrect(use_point2,member_no);
		
		
			// 결제 요청
			KakaoPayResultVO resultVO = kakaoPayService.prepare(startVO);
			
			// 결제 승인 페이지에서 사용할 수 있도록 session 데이터 추가
			// - partner_order_id, partner_user_id, tid
			session.setAttribute("partner_order_id", startVO.getPartner_order_id());
			session.setAttribute("partner_user_id", startVO.getPartner_user_id());
			session.setAttribute("tid", resultVO.getTid());
	
			// 세션에 저장 (이용권 번호, 할인금액+ 마일리지 사용금액, 적립금)
			session.setAttribute("license_time", license_time);
			session.setAttribute("license_no", license_no);
			session.setAttribute("sale_price", sale_price);
			session.setAttribute("use_point2", use_point2); // 사용 마일리지
			session.setAttribute("reward", reward); // 적립 마일리지
			session.setAttribute("coupon_discount2", coupon_discount2); // 쿠폰 할인 금액 
			session.setAttribute("coupon_no", coupon_no); // 쿠폰 번호 
			return "redirect:" + resultVO.getNext_redirect_pc_url();
	
	}	
	
	// 결제 승인 
	@GetMapping("/success")
	public String success(@RequestParam String pg_token, HttpSession session) throws URISyntaxException, ParseException {
		//session에서 회원번호 가져오기 
		MemberDto memberDto = (MemberDto) session.getAttribute("memberinfo"); 
		int member_no = memberDto.getMember_no();
		
		String partner_order_id = (String) session.getAttribute("partner_order_id");
		String partner_user_id = (String) session.getAttribute("partner_user_id");
		String tid= (String) session.getAttribute("tid");
		
		int license_time = (int) session.getAttribute("license_time");
		int license_no = (int) session.getAttribute("license_no");
		int sale_price = (int) session.getAttribute("sale_price");
		int use_point2 = (int) session.getAttribute("use_point2");
		int reward = (int) session.getAttribute("reward");
		int coupon_discount2 = (int) session.getAttribute("coupon_discount2");
		int coupon_no = (int) session.getAttribute("coupon_no");
		
		// 승인 요청 발송 
		KakaoPayFinishVO finishVO = kakaoPayService.approve(partner_order_id, partner_user_id, pg_token, tid);
	
		//  데이터베이스에 INSERT	
		String pay_his_date = finishVO.getApproved_at();
		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd'T'HH:mm:ss");	
		Date date = sdf.parse(pay_his_date);	
		
		int pay_his_price= finishVO.getAmount().getTotal();
		String tid_no = finishVO.getTid();
		//String pay_his_method = finishVO.getPayment_method_type();
	
		// 결제 내역에 추가 
		PayHisDto payHisDto = PayHisDto.builder()
															.tid_no(tid_no)
															.license_no(license_no)
															.member_no(member_no)
															.pay_his_date(date)
															.pay_his_discount(sale_price)
															.pay_his_price(pay_his_price)
														.build();		
		payDao.payInfoInsert(payHisDto); 		 
		
		//결제 포인트 사용/적립 내역 테이블에 저장 
		PayPointDto payPointDto = PayPointDto.builder()
																		.tid_no(tid_no)
																		.member_no(member_no)
																		.pay_use_point(use_point2)
																		.reward(reward)
																		.coupon_discount(coupon_discount2)
																		.coupon_no(coupon_no)
																	.build();
		payDao.payPointRegist(payPointDto);		
		
		//회원 충전 시간 업데이트 
		payDao.addCharge(member_no, license_time);
		
		if(use_point2>0) {
			// 회원 포인트 업데이트 (차감)
			payDao.minusPoint(payPointDto);
			//마일리지 내역 추가 
			payDao.registUsePoint(payPointDto);
		}
		if(reward>0) {
			// 회원 포인트 업데이트 (적립)
			payDao.plusPoint(payPointDto);
			//마일리지 내역 추가 
			payDao.registReward(payPointDto);
		}
		if(coupon_no!=0) { // 쿠폰이 선택 된 경우 
			payDao.deleteCoupon(member_no, coupon_no);
		}
		
		return "redirect:pay_success";
	}
	
		// 성공 페이지
		@GetMapping("/pay_success")
		public String pay_success() {
			return "member/pay/pay_success";
		}
		
		
		// 취소 페이지 
		@GetMapping("/cancel")
		public String cancel() {
			// 결제가 취소되었습니다 
			return "redirect:pay_cancel";
		}
		@GetMapping("/pay_cancel")
		public String pay_cancel() {
			return "member/pay/pay_cancel";
		}
		
		
		// 실패 페이지 
		@GetMapping("/fail")
		public String fail() {
			// 결제를 실패했습니다
			return "redirect:pay_fail";
		}
		@GetMapping("/pay_fail")
		public String pay_fail() {
			return "member/pay/pay_fail";
		}

		
		// 결제 조회 페이지 
		@GetMapping("/history")
		public String history(@RequestParam String tid,Model model,HttpSession session) throws URISyntaxException {
			
			// 결제 상세내역 조회를 위한 구문 
			PayInfoDto payInfoDto = payDao.getPayDetailInfo(tid);
			model.addAttribute("payInfoDto",payInfoDto);
			
			KakaoPayHistoryVO historyVO = kakaoPayService.history(tid);		
			model.addAttribute("historyVO",historyVO);

			return "member/pay/history";
		}
		// 결제 조회 및 취소 확인 페이지 
		@GetMapping("/pay_delete")
		public String pay_delete(@RequestParam String tid,Model model,HttpSession session) throws URISyntaxException {
			
			// 결제 상세내역 조회를 위한 구문 
			PayInfoDto payInfoDto = payDao.getPayDetailInfo(tid);
			model.addAttribute("payInfoDto",payInfoDto);
			
			KakaoPayHistoryVO historyVO = kakaoPayService.history(tid);		
			model.addAttribute("historyVO",historyVO);

			return "member/pay/pay_delete";
		}
		
		// 결제번호와 결제금액을 받아 결제 취소를 수행하는 코드를 구현 
		// 결제 취소
		@GetMapping("/delete")
		public String delete(@RequestParam String tid,@RequestParam int cancel_amount, HttpSession session) throws URISyntaxException {		
			
			kakaoPayService.delete(tid, cancel_amount);

			PayInfoDto payInfoDto = payDao.getPayDetailInfo(tid);
			int license_time = payInfoDto.getLicense_time();
			int reward = payInfoDto.getReward();
			int pay_use_point = payInfoDto.getPay_use_point();
			int coupon_no = payInfoDto.getCoupon_no(); 
			
			MemberDto memberDto = (MemberDto) session.getAttribute("memberinfo"); 
			int member_no = memberDto.getMember_no();
			
			// 결제 상태 변경, 회원 보유 시간 차감 
			payDao.changeStatus(tid);
			payDao.minusCharge(member_no, license_time);
			
			//마일리지 적립/차감 취소
			if(reward>0) {
				payDao.reMinusPoint(member_no, reward);
				payDao.reRegistUsePoint(member_no, pay_use_point);
			}
			if(pay_use_point>0) {
				payDao.rePlusPoint(member_no, pay_use_point);
				payDao.reRegistReward(member_no, reward);
			}
			// 사용된 쿠폰 재 지급
			if(coupon_no!=0){
				payDao.addCoupon(payInfoDto);
			}
			return "redirect:delete_finish";
		}

		@GetMapping("/delete_finish")
		public String delete_finish() {
			
			return "member/pay/delete_finish";
		}
		
		// 추가 결제 요청
		@PostMapping("/serve_prepare")
		public String serve_prepare(@RequestParam int license_no, // 이용권 번호 
											@RequestParam int sale_price, //총 할인 금액
											@ModelAttribute KakaoPayStartVO startVO, 
											HttpSession session) throws URISyntaxException {
			MemberDto memberDto = (MemberDto) session.getAttribute("memberinfo"); 
			int member_no = memberDto.getMember_no();	
			
			String partner_user_id = payDao.getId(member_no); // 회원 번호로 id가져오기
			String partner_order_id = Integer.toString(payDao.getOrderSeq()); // 시퀀스 번호 생성하여 부여 
			
			startVO.setPartner_order_id(partner_order_id);
			startVO.setPartner_user_id(partner_user_id);
			startVO.setItem_name("후불 이용 시간");

			// 결제 요청 전 확인 
			boolean isCorrect = kakaoPayService.isCorrect(sale_price,member_no);
			
			if(!isCorrect) {
				// 결제 요청
				KakaoPayResultVO resultVO = kakaoPayService.serve_prepare(startVO);
				
				// 결제 승인 페이지에서 사용할 수 있도록 session 데이터 추가
				// - partner_order_id, partner_user_id, tid
				session.setAttribute("partner_order_id", startVO.getPartner_order_id());
				session.setAttribute("partner_user_id", startVO.getPartner_user_id());
				session.setAttribute("tid", resultVO.getTid());
		
				
				// 세션에 저장 (이용권 번호, 할인금액+ 마일리지 사용금액, 적립금)
				session.setAttribute("license_time", 0);
				session.setAttribute("license_no", license_no);
				session.setAttribute("sale_price", sale_price);
				session.setAttribute("use_point2", sale_price); // 사용 마일리지
				session.setAttribute("reward", 0); // 적립 마일리지
				session.setAttribute("coupon_discount2", 0); // 쿠폰 할인 금액 
				session.setAttribute("coupon_no", 0); // 쿠폰 번호 
				return "redirect:" + resultVO.getNext_redirect_pc_url();
			} 
			else {
				return "";
			}
		}

}
