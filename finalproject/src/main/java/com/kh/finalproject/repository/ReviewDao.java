package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.VO.PagingVO;
import com.kh.finalproject.entity.ReviewDto;

public interface ReviewDao {
	
	//리뷰 등록
	void regist(ReviewDto reviewDto);
	
	//리뷰 리스트 + 페이징
	List<ReviewDto> getList(int branch_no,PagingVO pagingVO);
	
	//리뷰 수정
	void edit(String review_title,String review_content,int review_no);
	
	//리뷰삭제
	void delete(int review_no);
	
	//페이징 처리를 위한 게시글 개수
	int countReview(int branch_no);
	
	//(관리자)전체리뷰 뽑기
	List<ReviewDto> getAdminList();
}
