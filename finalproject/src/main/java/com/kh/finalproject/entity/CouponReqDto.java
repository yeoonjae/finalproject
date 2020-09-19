package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CouponReqDto {

	private int coupon_req_no;
	private int branch_no;
	private int admin_no;
	private String branch_name;
	private String coupon_req_name;
	private int coupon_req_discount;
	private String coupon_req_date;
	private String coupon_req_resp;
	private String coupon_req_start;
	private String coupon_req_finish;
	private String coupon_req_state;
	private String coupon_req_detail;
	
	public String getCoupon_req_date() {
		return coupon_req_date.substring(0, 10);
	}
	public String getCoupon_req_start() {
		return coupon_req_start.substring(0, 10);
	}
	public String getCoupon_req_finish() {
		return coupon_req_finish.substring(0, 10);
	}
	public String getCoupon_req_resp() {
		if(coupon_req_resp != null) {
			return coupon_req_resp.substring(0, 10);			
		} else {
			return coupon_req_resp;
		}
	}
}
