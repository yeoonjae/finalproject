package com.kh.finalproject.service;

import com.kh.finalproject.entity.MemberDto;

public interface LicenseHisService {
	
	boolean checkIn(int row, int col, MemberDto memberDto);
	boolean checkOut(MemberDto memberDto);

}
