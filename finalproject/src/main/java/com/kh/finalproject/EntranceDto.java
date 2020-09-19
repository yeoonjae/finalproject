package com.kh.finalproject;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class EntranceDto {
	
	private int entrance_no;
	private int branch_no;
	private String entrance_location;

}
