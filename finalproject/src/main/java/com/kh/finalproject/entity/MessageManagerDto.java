package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class MessageManagerDto {
	private int message_manager_no;
	private int message_no;
	private int admin_no;//주인공
	private int admin2_no;
	private String message_manager_date;
	private int message_manager_read;
	private String message_manager_type;//수신
	
	private String message_title;
	private String message_content;
	private String admin_name;

}
