package com.kh.finalproject.pay;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

// 이 클래스는 "결제 요청"에 대한 응답이 저장될 클래스 
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class KakaoPayResultVO {
	private String tid;
	private String next_redirect_pc_url;
	private String created_at;
}
