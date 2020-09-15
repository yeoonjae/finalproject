package com.kh.finalproject.pay;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class KakaoPayFinishVO {
	private String aid,tid,cid,sid;
	private String partner_order_id;
	private String partner_user_id;
	private String payment_method_type;	
	private KakaoPayFinishAmountVO amount;
	private KakaoPayFinishAmountVO card_info;	
	private String item_name;
	private String item_code;
	private int quantity;
	private String created_at;
	private String approved_at;
	private String payload;
}
