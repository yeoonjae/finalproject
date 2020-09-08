package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CouponDto {

	private int coupon_no;
	private int branch_no;
	private int admin_no;
	private String coupon_name;
	private int coupon_discount;
	private String coupon_category;
	private String coupon_date;
	private String coupon_start;
	private String coupon_finish;
}
