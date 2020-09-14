package com.kh.finalproject.repository;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.finalproject.entity.BranchImgDto;

public interface BranchImgDao {
	//파일 저장
	void regist(List<MultipartFile> file);
	
	//파일 불러오기
	List<BranchImgDto> getImg(int branch_no);
}
