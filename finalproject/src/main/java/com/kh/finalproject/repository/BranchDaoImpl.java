package com.kh.finalproject.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.BranchDto;

@Repository
public class BranchDaoImpl implements BranchDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	//지점 등록 메소드
	public int regist(BranchDto branchDto) {
		int no = sqlSession.selectOne("branch.getSeq");
		branchDto.setBranch_no(no);
		branchDto.setAdmin_no(1);
		branchDto.setBranch_layout("null");
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
	
}
