package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class LicenseHisDto {

	private int license_his_no, member_no, seat_no, license_his_pay, seat_row, seat_col;
	private String license_his_start, license_his_finish;
}
