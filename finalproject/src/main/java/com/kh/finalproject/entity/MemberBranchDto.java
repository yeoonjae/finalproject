package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor

// 결제 조회 시 필요한 정보 
public class MemberBranchDto {
	private int member_no;
	private int branch_no;
	private int member_point;
	private String branch_name;
	
}
