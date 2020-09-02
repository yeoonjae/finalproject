package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class PayHisDto {
	private int license_no;
	private int member_no;
	private String pay_his_date;
	private int pay_his_discount;
	private String pay_his_method;
	private int pay_his_price;
}
