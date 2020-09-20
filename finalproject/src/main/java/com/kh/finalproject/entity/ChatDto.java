package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class ChatDto {
	private int chat_no;
	private String chat_q;
	private String chat_a;
	private String chat_type;
}
