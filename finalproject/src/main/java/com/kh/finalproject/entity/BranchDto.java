package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BranchDto {
	private int branch_no;
	private int local_no;
	private int admin_no;
	private String branch_name;
	private long size;
	private int room_cnt;
	private int seat_cnt;
	private int branch_locker_cnt;
	private String branch_layout;

}
