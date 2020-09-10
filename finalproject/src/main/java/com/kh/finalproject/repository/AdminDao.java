package com.kh.finalproject.repository;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.finalproject.entity.AdminDto;

public interface AdminDao {
	//관리자 계정 등록
	void regist(AdminDto adminDto);
	//관리자 계정 로그인
	boolean login(String id, String password);
	//관리자 계정 조회
	AdminDto get(int admin_no);
	//관리자 계정 아이디로 관리자 번호 받기
	int getNo(String id);
	//관리자 계정 수정
	void edit(AdminDto adminDto);
	//관지라 계정 삭제
	void delete(int admin_no);
	//관리자 리스트 조회
	List<AdminDto> getList();
	//관리자 리스트 조회 (순서화)
	List<AdminDto> getList(String col, String order);
	//관리자 번호 얻어오기
	int getSeq();
	//관리자 권한 '지점'만 뽑기
	List<AdminDto> getBranchAdminList();
	//관리자 로그인 시간 업데이트
	void updateLoginTime(int no);
	// 관리자 지점과 JOIN한 정보 단일 조회
	AdminDto getAdminInfo(int admin_no);



}
