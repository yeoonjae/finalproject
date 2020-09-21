package com.kh.finalproject.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.finalproject.pay.KakaoPayDeleteVO;
import com.kh.finalproject.pay.KakaoPayFinishVO;
import com.kh.finalproject.pay.KakaoPayHistoryVO;
import com.kh.finalproject.pay.KakaoPayResultVO;
import com.kh.finalproject.pay.KakaoPayStartVO;
import com.kh.finalproject.repository.PayDao;

@Service
public class KakaoPayServiceImpl implements KakaoPayService {
	@Autowired
	private PayDao payDao; 
	
	// 가맹점 코드: 상수로 설정
	public static final String CID = "TC0ONETIME";
	//
	public static final String cancel_tax_free_amount = "0";

	// 결제 요청 메소드
	@Override
	public KakaoPayResultVO prepare(KakaoPayStartVO startVO) throws URISyntaxException {
		// 1. 도구 생성
		RestTemplate template = new RestTemplate();

		// 2. Header 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK d57c34e99d6acf363a578ead15befe0a");
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// 3. Body 생성
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", CID);
		body.add("partner_order_id", startVO.getPartner_order_id());
		body.add("partner_user_id", startVO.getPartner_user_id());
		body.add("item_name", startVO.getItem_name());
		body.add("quantity", "1"); // 수량은 항상 1이므로 1로 설정
		body.add("total_amount", String.valueOf(startVO.getTotal_amount()));
		body.add("tax_free_amount", "0");
		// 주의 : 주소는 반드시 API 에서 승인된 URL을 사용해야 한다.
		body.add("approval_url", "http://localhost:8080/finalproject/member/pay/success");
		body.add("cancel_url", "http://localhost:8080/finalproject/member/pay/cancel");
		body.add("fail_url", "http://localhost:8080/finalproject/member/pay/fail");

		// 4. Header 와 Body를 합성
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);

		// 5. 주소 정의
		URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");

		// 6. 모든 준비가 완료되었으므로 template을 이용하여 요청을 전송 (카카오페이한테)
		KakaoPayResultVO resultVO = template.postForObject(uri, entity, KakaoPayResultVO.class);

		return resultVO;

	}

	@Override
	public KakaoPayFinishVO approve(String partner_order_id, String partner_user_id, String pg_token, String tid)
			throws URISyntaxException {
		// 카카오 승인 서버에 승인요청을 보낸다
		// - 준비물 : 5개
		// - 결과물 : KakaoPayFinishVO에 다 들어감

		// 1. 도구 생성
		RestTemplate template = new RestTemplate();

		// 2. Header 생성
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK d57c34e99d6acf363a578ead15befe0a");
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// 3. Body 생성
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", CID);
		body.add("partner_order_id", partner_order_id);
		body.add("partner_user_id", partner_user_id);
		body.add("tid", tid);
		body.add("pg_token", pg_token);

		// 4. Header 와 Body를 합성
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);

		// 5. 주소 정의
		URI uri = new URI("https://kapi.kakao.com/v1/payment/approve");

		// 6. 모든 준비가 완료되었으므로 template을 이용하여 요청을 전송 (카카오페이한테)
		KakaoPayFinishVO finishVO = template.postForObject(uri, entity, KakaoPayFinishVO.class);

		return finishVO;
	}

	public KakaoPayHistoryVO history(String tid) throws URISyntaxException {
		// 1. 도구 생성
		RestTemplate template = new RestTemplate();
						
		// 2. Header 생성 
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK d57c34e99d6acf363a578ead15befe0a");
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// 3. Body 생성
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", CID);
		body.add("tid", tid);
		
		// 4. Header 와 Body를 합성
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body,headers);
		
		// 5. 주소 정의 
		URI uri = new URI("https://kapi.kakao.com/v1/payment/order");
		
		KakaoPayHistoryVO historyVO = template.postForObject(uri, entity, KakaoPayHistoryVO.class);		
	
		return historyVO;

	}

	@Override
	public KakaoPayDeleteVO delete(String tid, int cancel_amount) throws URISyntaxException {
		// 1. 도구 생성
		RestTemplate template = new RestTemplate();
						
		// 2. Header 생성 
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "KakaoAK d57c34e99d6acf363a578ead15befe0a");
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		// 3. Body 생성
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("cid", CID);
		body.add("tid", tid);
		body.add("cancel_amount", String.valueOf(cancel_amount));
		body.add("cancel_tax_free_amount",cancel_tax_free_amount);
		
		// 4. Header 와 Body를 합성
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body,headers);
		
		// 5. 주소 정의 
		URI uri = new URI("https://kapi.kakao.com/v1/payment/cancel");
		
		KakaoPayDeleteVO deleteVO = template.postForObject(uri, entity, KakaoPayDeleteVO.class);	
		
		return deleteVO;
	}

	// 사용 마일리지 < 보유 마일리지 인 경우에만 결제 진행
	@Override
	public boolean isCorrect(int use_point,int member_no) {
		int member_point = payDao.getPoint(member_no);
		if(use_point <= member_point) return true;
		else return false;
	}
	
	// 추가 결제 요청 메소드
	// 결제 요청 메소드
		@Override
		public KakaoPayResultVO serve_prepare(KakaoPayStartVO startVO) throws URISyntaxException {
			// 1. 도구 생성
			RestTemplate template = new RestTemplate();

			// 2. Header 생성
			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization", "KakaoAK d57c34e99d6acf363a578ead15befe0a");
			headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

			// 3. Body 생성
			MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
			body.add("cid", CID);
			body.add("partner_order_id", startVO.getPartner_order_id());
			body.add("partner_user_id", startVO.getPartner_user_id());
			body.add("item_name", startVO.getItem_name());
			body.add("quantity", "1"); // 수량은 항상 1이므로 1로 설정
			body.add("total_amount", String.valueOf(startVO.getTotal_amount()));
			body.add("tax_free_amount", "0");
			// 주의 : 주소는 반드시 API 에서 승인된 URL을 사용해야 한다.
			body.add("approval_url", "http://localhost:8080/finalproject/member/pay/success");
			body.add("cancel_url", "http://localhost:8080/finalproject/member/pay/cancel");
			body.add("fail_url", "http://localhost:8080/finalproject/member/pay/fail");

			// 4. Header 와 Body를 합성
			HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);

			// 5. 주소 정의
			URI uri = new URI("https://kapi.kakao.com/v1/payment/ready");

			// 6. 모든 준비가 완료되었으므로 template을 이용하여 요청을 전송 (카카오페이한테)
			KakaoPayResultVO resultVO = template.postForObject(uri, entity, KakaoPayResultVO.class);

			return resultVO;

		}
}
