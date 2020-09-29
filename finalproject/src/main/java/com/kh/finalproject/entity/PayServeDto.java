package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PayServeDto {

	private int member_no, branch_no, license_his_no, license_his_pay, member_point; 
	private String branch_name;
}
