package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class PayPointDto {
	private String tid_no;
	private int member_no;
	private int pay_use_point;
	private int reward;
	private int coupon_discount;
	private int coupon_no;
}
