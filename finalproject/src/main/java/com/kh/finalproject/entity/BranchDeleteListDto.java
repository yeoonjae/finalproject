package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BranchDeleteListDto {
	private int delete_branch_no;
	private int admin_no;
	private String branch_name;
	private String start_delete_date;
	private String finish_delete_date;
	private String delete_status;
	
	private String admin_name;
}
