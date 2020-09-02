package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.BranchDto;

public interface BranchDao {
	//지점 등록 메소드(지점 번호 반환)
	int regist(BranchDto branchDto);
	//지점 리스트
	List<BranchDto> getList();
	//배치도 등록
	void layout_regist(String branch_layout,int branch_no);
	//지점 단일조회
	BranchDto get(int branch_no);
	//지점 수정
	void edit(int branch_no);
}
