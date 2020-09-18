package com.kh.finalproject.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.VO.PagingVO;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private HttpSession session;
	
	//리뷰 등록
	public void regist(ReviewDto reviewDto) {
		MemberDto memberDto = (MemberDto)session.getAttribute("memberinfo");
		reviewDto.setMember_no(memberDto.getMember_no());
		reviewDto.setBranch_no(memberDto.getBranch_no());
		sqlSession.insert("review.regist", reviewDto);
	}

	//리뷰 리스트 + 페이징
	public List<ReviewDto> getList(int branch_no,PagingVO pagingVO) {
		Map<String, Object> map = new HashMap<>();
		map.put("branch_no", branch_no);
		map.put("start", pagingVO.getStart());
		map.put("end", pagingVO.getEnd());
		return sqlSession.selectList("review.getListBranchReview", map);
	}

	//리뷰 수정
	public void edit(String review_title,String review_content,int review_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("review_title", review_title);
		map.put("review_content", review_content);
		map.put("review_no", review_no);
		sqlSession.update("review.edit", map);
	}

	//리뷰 삭제
	public void delete(int review_no) {
		sqlSession.delete("review.delete", review_no);
	}

	//페이징 처리를 위한 게시글 개수
	public int countReview(int branch_no) {
		int a = sqlSession.selectOne("review.getCount", branch_no);
		System.out.println("a : "+a);
		return sqlSession.selectOne("review.getCount", branch_no);
	}
	
	

}
