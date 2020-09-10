package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class BranchImgDto {
	private int branch_img_no;
	private int branch_no;
	private String branch_img_name;
	private long branch_img_size;
	private String branch_img_type;
}
