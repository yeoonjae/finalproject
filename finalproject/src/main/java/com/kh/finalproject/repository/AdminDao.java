package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.AdminDto;

public interface AdminDao {
	//관리자 등록
	void regist(AdminDto adminDto);
	//관리자 로그인
	boolean login(String id, String password);
	//관리자 단일조회
	AdminDto get(int admin_no);
	//관리자 번호조회
	int getNo(String id);
	//관리자 정보 수정
	void edit(AdminDto adminDto);
	//관리자 삭제
	void delete(int admin_no);
	//관리자 목록
	List<AdminDto> getList();
	//관리자 정렬 목록
	List<AdminDto> getList(String col, String order);
	//관리자 시퀀스 번호 미리뽑기
	int getSeq();
	//관리자 권한 '지점'만 뽑기
	List<AdminDto> getBranchAdminList();


}
