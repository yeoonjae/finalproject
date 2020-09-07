package com.kh.finalproject.repository;

import com.kh.finalproject.entity.MemberBranchDto;

public interface PayDao {
	
	// 회원 번호로 지점명 조회 
	MemberBranchDto getBranch(int member_no);
}
