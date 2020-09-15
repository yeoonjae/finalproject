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
	private long branch_size;
	private int branch_room_cnt;
	private int branch_seat_cnt;
	private int branch_locker_cnt;
	
	private String branch_post;
	private String branch_basic_addr;
	private String branch_detail_addr;
	private String branch_phone;
	private String branch_layout;
	private int branch_img_no;
	private String local_name;
	private String admin_name;
}
