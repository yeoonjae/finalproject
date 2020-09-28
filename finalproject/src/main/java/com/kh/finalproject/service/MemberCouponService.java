package com.kh.finalproject.service;

import java.util.List;

import com.kh.finalproject.VO.PagingVO;
import com.kh.finalproject.entity.MemberCouponDto;

public interface MemberCouponService {

	// 게시물 총 갯수
	int countCoupon(int member_no);

	// 페이징 처리 게시글 조회
	public List<MemberCouponDto> selectCoupon(int member_no, PagingVO vo);
}
