package com.kh.finalproject.service;

import java.util.List;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;

import com.kh.finalproject.entity.BranchImgDto;

public interface BranchService {
	//이미지 단일 다운로드
	ResponseEntity<ByteArrayResource> getImg(int img_no) throws Exception;
	
	//지점별 이미지 list
	List<BranchImgDto> getBranchImg(int branch_no);
	
	ResponseEntity<ByteArrayResource> getImgOne(int branch_no) throws Exception;
}
