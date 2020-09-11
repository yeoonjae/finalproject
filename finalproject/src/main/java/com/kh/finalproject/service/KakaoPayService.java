package com.kh.finalproject.service;

import java.net.URISyntaxException;

import com.kh.finalproject.pay.KakaoPayDeleteVO;
import com.kh.finalproject.pay.KakaoPayFinishVO;
import com.kh.finalproject.pay.KakaoPayHistoryVO;
import com.kh.finalproject.pay.KakaoPayResultVO;
import com.kh.finalproject.pay.KakaoPayStartVO;


public interface KakaoPayService {
		// 결제 요청 메소드 
		KakaoPayResultVO prepare(KakaoPayStartVO startVO) throws URISyntaxException;
	
		// 결제 승인 메소드 	
		KakaoPayFinishVO approve(
				String partner_order_id, 
				String partner_user_id, 
				String pg_token, 
				String tid) throws URISyntaxException;
		// 주문 조회 메소드 
		KakaoPayHistoryVO history(String tid) throws URISyntaxException;
		// 결제 취소 메소드
		KakaoPayDeleteVO delete(String tid, int cancel_amount) throws URISyntaxException;
}
