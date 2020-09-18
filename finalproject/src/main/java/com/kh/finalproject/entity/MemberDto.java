package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDto {
	private int member_no;
	private int branch_no;
	private String member_name;
	private String member_email;
	private String member_pw;
	private int member_point;
	private String member_join;
	private String member_login;
	private int member_charge;
	// 지점명, 지역명 추가
	private String branch_name;
	private String local_name;
	private String local_no;
}
