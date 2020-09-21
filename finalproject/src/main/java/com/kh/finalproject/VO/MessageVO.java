package com.kh.finalproject.VO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MessageVO {
   private int sender_no;
   private String[] receiver_name;
   private String message_title;
   private String message_content;
   
}