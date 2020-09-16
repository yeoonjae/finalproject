package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MemberCouponDto {
	private int coupon_no;
	private String coupon_name;
	private int coupon_discount;
	private String coupon_start;
	private String coupon_finish;
	
	public String getCoupon_start() {
	      return coupon_start.substring(0, 10);
	}
	public String getCoupon_finish() {
	      return coupon_finish.substring(0, 10);
	 }
}
