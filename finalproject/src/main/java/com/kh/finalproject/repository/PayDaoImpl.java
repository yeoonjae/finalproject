package com.kh.finalproject.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MemberBranchDto;
import com.kh.finalproject.entity.PayHisDto;
import com.kh.finalproject.entity.PayInfoDto;

@Repository
public class PayDaoImpl implements PayDao{

	@Autowired
	SqlSession sqlSession;
	
	// 지점명 가져오기 (회원 정보 단일조회)
	@Override
	public MemberBranchDto getBranch(int member_no) {
		MemberBranchDto memberBranchDto = sqlSession.selectOne("pay.getBranch", member_no);
		return memberBranchDto;
	}

	// partner_user_id 를 가져오기 위한 sql문 
	@Override
	public String getId(int member_no) {
		String member_id = sqlSession.selectOne("pay.getId",member_no);
		return member_id;
	}

	//partner_order_id 를 가져오기 위한 sql문
	@Override
	public int getOrderSeq() {
		int order_seq = sqlSession.selectOne("pay.getOrderSeq");
		return order_seq;
	}

	//카카오페이 후 결제 정보를 등록 
	@Override
	public void payInfoInsert(PayHisDto payHisDto) {
		sqlSession.insert("pay.insertPayInfo",payHisDto);		
	}

	// 결제정보 조회
	@Override
	public List<PayInfoDto> getPayInfo(int member_no) {
		return sqlSession.selectList("pay.getPayInfo",member_no);
	}



}
