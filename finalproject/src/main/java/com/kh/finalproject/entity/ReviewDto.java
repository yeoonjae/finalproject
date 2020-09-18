package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReviewDto {

	private int review_no;
	private int member_no;
	private String review_title;
	private String review_content;
	private String review_date;
	private int branch_no;
	
	//회원 이름 추가
	private String member_name;
	
	//좋아요 싫어요 추가
	private int like_count;
	private int hate_count;
	
}
