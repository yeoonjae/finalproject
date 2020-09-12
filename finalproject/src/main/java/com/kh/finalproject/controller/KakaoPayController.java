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

import com.kh.finalproject.entity.PayHisDto;
import com.kh.finalproject.entity.PayPointDto;
import com.kh.finalproject.entity.PointHisDto;
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
	public String prepare(@RequestParam int member_no, 
										@RequestParam int license_no, // 이용권 번호 
										@RequestParam int sale_price, //총 할인 금액
										@RequestParam int use_point2, //사용한 마일리지
										@RequestParam int reward, // 적립금
										@ModelAttribute KakaoPayStartVO startVO, 
										HttpSession session) throws URISyntaxException {
		
		String partner_user_id = payDao.getId(member_no); // 회원 번호로 id가져오기
		String partner_order_id = Integer.toString(payDao.getOrderSeq()); // 시퀀스 번호 생성하여 부여 
		
		startVO.setPartner_order_id(partner_order_id);
		startVO.setPartner_user_id(partner_user_id);

		// 결제 요청
		KakaoPayResultVO resultVO = kakaoPayService.prepare(startVO);
		
		// 결제 승인 페이지에서 사용할 수 있도록 session 데이터 추가
		// - partner_order_id, partner_user_id, tid
		session.setAttribute("partner_order_id", startVO.getPartner_order_id());
		session.setAttribute("partner_user_id", startVO.getPartner_user_id());
		session.setAttribute("tid", resultVO.getTid());

		// 세션에 저장 (회원 번호, 이용권 번호, 할인금액+ 마일리지 사용금액, 적립금)
		session.setAttribute("member_no", member_no);
		session.setAttribute("license_no", license_no);
		session.setAttribute("sale_price", sale_price);
		session.setAttribute("use_point2", use_point2); // 사용 마일리지
		session.setAttribute("reward", reward); // 적립 마일리지
		
		return "redirect:" + resultVO.getNext_redirect_pc_url();
	}
	
	// 결제 승인 
	@GetMapping("/success")
	public String success(@RequestParam String pg_token, HttpSession session) throws URISyntaxException, ParseException {
		String partner_order_id = (String) session.getAttribute("partner_order_id");
		String partner_user_id = (String) session.getAttribute("partner_user_id");
		String tid= (String) session.getAttribute("tid");
		int member_no = (int) session.getAttribute("member_no");
		int license_no = (int) session.getAttribute("license_no");
		int sale_price = (int) session.getAttribute("sale_price");
		int use_point2 = (int) session.getAttribute("use_point2");
		int reward = (int) session.getAttribute("reward");
		
		// 승인 요청 발송 
		KakaoPayFinishVO finishVO = kakaoPayService.approve(partner_order_id, partner_user_id, pg_token, tid);
		
		log.debug("finishVO = {}",finishVO);
		log.debug("결제 금액 ={}",finishVO.getAmount().getTotal());
		
		//  데이터베이스에 INSERT
		
		String pay_his_date = finishVO.getApproved_at();
		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd'T'HH:mm:ss");	
		Date date = sdf.parse(pay_his_date);
		
		int pay_his_price= finishVO.getAmount().getTotal();
		String tid_no = finishVO.getTid();
		String pay_his_method = finishVO.getPayment_method_type();
		
		log.debug("결제 승인 날짜 = {}",pay_his_date);
		
		// 결제 내역에 추가 
		PayHisDto payHisDto = PayHisDto.builder()
															.tid_no(tid_no)
															.license_no(license_no)
															.member_no(member_no)
															.pay_his_date(date)
															.pay_his_discount(sale_price)
															.pay_his_price(pay_his_price)
															.pay_his_method(pay_his_method)
														.build();		
		payDao.payInfoInsert(payHisDto); 
		 
		//결제 포인트 사용/적립 내역 테이블에 저장 
		PayPointDto payPointDto = PayPointDto.builder()
																		.tid_no(tid_no)
																		.member_no(member_no)
																		.pay_use_point(use_point2)
																		.reward(reward)
																	.build();
		payDao.payPointRegist(payPointDto);
		
		// 회원 포인트 업데이트 (적립/차감)
		payDao.plusPoint(payPointDto);
		payDao.minusPoint(payPointDto);
		
		//마일리지 기록 남기기
		if(use_point2>0) {
			payDao.registUsePoint(payPointDto);
		}
		if(reward>0) {
			payDao.registReward(payPointDto);
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
			// 할거 하고(예. 결제가 취소되었습니다 등)
			return "redirect:result_cancel";
		}
		@GetMapping("/result_cancel")
		public String result_cancel() {
			return "member/pay/result_cancel";
		}
		
		
		// 실패 페이지 
		@GetMapping("/fail")
		public String fail() {
			// 할거 하고 
			return "redirect:result_fail";
		}
		@GetMapping("/result_fail")
		public String result_fail() {
			return "member/pay/result_fail";
		}

		
		// 결제 조회 페이지 
		@GetMapping("/history")
		public String history(@RequestParam String tid, Model model) throws URISyntaxException {
			KakaoPayHistoryVO historyVO = kakaoPayService.history(tid);		
			model.addAttribute("historyVO",historyVO);
			
			log.debug("historyVO = {}",historyVO);
			
			return "member/pay/history";
		}
		

}
