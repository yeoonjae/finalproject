package com.kh.finalproject.service;

import java.util.List;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ResponseEntity;

import com.kh.finalproject.VO.PagingVO;
import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.BranchImgDto;

public interface BranchService {
	//이미지 단일 다운로드
	ResponseEntity<ByteArrayResource> getImg(int img_no) throws Exception;
	
	//지점별 이미지 list
	List<BranchImgDto> getBranchImg(int branch_no);
	
	//지점 번호로 이미지 하나뽑기
	ResponseEntity<ByteArrayResource> getImgOne(int branch_no) throws Exception;
	
	//페이징 처리를 위한 게시글 개수
	int countBranch();
	
	//페이징 처리 게시글 조회
	List<BranchDto> selectBranch(PagingVO pagingVO);
}
