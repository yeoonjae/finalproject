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
	
	//회원 이름 추가
	private String member_name;
}
