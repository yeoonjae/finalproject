package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.AdminDto;

public interface AdminDao {

	void regist(AdminDto adminDto);

	boolean login(String id, String password);

	AdminDto get(int admin_no);

	int getNo(String id);

	void edit(AdminDto adminDto);

	void delete(int admin_no);
	List<AdminDto> getList();
	List<AdminDto> getList(String col, String order);

	int getSeq();

	void updateLoginTime(int no);



}
