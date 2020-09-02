package com.kh.finalproject.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MemberBranchDto;

@Repository
public class PayDaoImpl implements PayDao{

	@Autowired
	SqlSession sqlSession;
	@Override
	public MemberBranchDto getBranch(int member_no) {
		MemberBranchDto memberBranchDto = sqlSession.selectOne("pay.getBranch", member_no);
		return memberBranchDto;
	}

}
