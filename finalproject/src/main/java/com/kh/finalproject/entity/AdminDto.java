package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class AdminDto {
	private int admin_no, branch_no; 
	private String admin_auth, admin_name , admin_id, 
	admin_pw , admin_join , admin_login;
	private String branch_name;
}
