package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PointHisDto {
	private int point_his_no;
	private int member_no;
	private int point_no;
	private int point_his_score;
	private String point_his_detail; 
	private String point_his_date;
	// 추가항목
	private String point_type;
	private String point_detail;
	
	public String getPoint_his_date() {
		return point_his_date.substring(0, 10);
	}
}
