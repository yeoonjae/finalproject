package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@NoArgsConstructor@AllArgsConstructor@Builder
public class NoticeDto {
	 private int notice_no;
	private String notice_title,
	   notice_content,
	   notice_time;
}
