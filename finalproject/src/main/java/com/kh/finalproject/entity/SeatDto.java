package com.kh.finalproject.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SeatDto {
	private int seat_no, branch_no, seat_row, seat_col, seat_state;
	private String seat_direction, seat_type;
}
