package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MessageMemberDto {
	private int message_member_no;
	private int message_no;
	private int admin_no;
	private int member_no;
	private String member_name;
	private String member_pw;
	private String message_member_date;
	private int message_member_read;
	private String message_member_type;
	
	private String message_title;
	private String message_content;
	private String admin_name;
}
