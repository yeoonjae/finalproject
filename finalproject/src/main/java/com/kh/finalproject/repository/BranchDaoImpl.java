package com.kh.finalproject.repository;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.finalproject.VO.BranchImgVO;
import com.kh.finalproject.entity.BranchDto;
import com.kh.finalproject.entity.BranchImgDto;

@Repository
public class BranchDaoImpl implements BranchDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	//지점 등록 메소드
	public int regist(BranchDto branchDto) {
		int no = sqlSession.selectOne("branch.getSeq");//시퀀스 번호 미리생성
		branchDto.setBranch_no(no);
		branchDto.setBranch_layout("");
		sqlSession.insert("branch.regist", branchDto);

		return no;
	}

	//지점 리스트
	public List<BranchDto> getList() {
		List<BranchDto> list = sqlSession.selectList("branch.getList");
		return list;
	}

	//배치도 등록
	public void layout_regist(String branch_layout, int branch_no) {
		Map<Object, Object> map = new HashMap<>();
		map.put("branch_layout", branch_layout);
		map.put("branch_no", branch_no);
		sqlSession.update("branch.layout_regist", map);
	}

	//지점 단일조회
	public BranchDto get(int branch_no) {
		BranchDto branchDto = sqlSession.selectOne("branch.get", branch_no);
		return branchDto;
	}

	//지점 수정
	public void edit(BranchDto branchDto) {
		sqlSession.update("branch.edit", branchDto);
	}

	//지점 이미지 시퀀스 생성
	public int imgGetSeq() {
		return sqlSession.selectOne("branchImg.getSeq");
	}

	//지점 이미지 등록
	public void imgRegist(BranchImgDto branchImgDto) {
		sqlSession.insert("branchImg.regist", branchImgDto);
		
	}
}
