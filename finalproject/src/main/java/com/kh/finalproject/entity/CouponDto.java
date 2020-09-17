package com.kh.finalproject.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

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
	private int member_no;
	private String coupon_name;
	private int coupon_discount;
	private String coupon_category;
	private String coupon_date;
	private String coupon_start;
	private String coupon_finish;
	private int group_no;
	private String branch_name;
	
	public String getCoupon_issue() {
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String start = getCoupon_start().substring(0, 10);
		String finish = getCoupon_finish().substring(0, 10);
		
		if(start.compareTo(today) > 0) {
			return "예정";
		} else {
			if(finish.compareTo(today) >= 0) {
				return "유효";
			} else {
				return "만료";
			}
		}
	}
	
	public String getCoupon_date() {
		return coupon_date.substring(0, 10);
	}
	public String getCoupon_start() {
		return coupon_start.substring(0, 10);
	}
	public String getCoupon_finish() {
		return coupon_finish.substring(0, 10);
	}
}
