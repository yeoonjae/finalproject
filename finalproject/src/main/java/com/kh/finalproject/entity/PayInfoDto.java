package com.kh.finalproject.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class PayInfoDto {
	private int pay_his_no;
	private String tid_no;
	private int member_no;
	private Date pay_his_date;
	private int pay_his_discount;
	private String pay_his_method;
	private int pay_his_price;
	private int license_time;
	private int license_price;
	private String pay_his_state;
}
