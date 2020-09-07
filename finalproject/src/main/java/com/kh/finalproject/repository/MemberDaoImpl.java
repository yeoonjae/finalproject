package com.kh.finalproject.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.PointHisDto;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private PasswordEncoder encoder;
	// 회원 리스트 조회
	@Override
	public List<MemberDto> getList() {
		return sqlSession.selectList("member.getList");
	}
	
	// 회원 마일리지 적립
	@Override
	public void plusPoint(PointHisDto pointHisDto) {
		sqlSession.update("member.plusPoint", pointHisDto);
	}
	
	// 회원 마일리지 차감
	@Override
	public void minusPoint(PointHisDto pointHisDto) {
		sqlSession.update("member.minusPoint", pointHisDto);		
	}
	//회원 정보 조회
	@Override
	public MemberDto get(int no) {
		
		return sqlSession.selectOne("member.get", no);
	}
	//회원 정보 삭제
	@Override
	public void delete(int no) {
		// TODO Auto-generated method stub
		sqlSession.delete("member.delete", no);
	}
	//회원 정보 수정
	@Override
	public int edit(MemberDto memberDto) {
		return sqlSession.update("member.edit", memberDto);
	}
	//회원 가입
	@Override
	public void join(MemberDto memberDto) {
		
		// TODO Auto-generated method stub
		sqlSession.insert("member.join", memberDto);
	}
	//로그인
	@Override
	public boolean login(String id, String pw) {
		MemberDto memberDto = sqlSession.selectOne("member.login", id);
		if(memberDto !=null) {	
			return encoder.matches(pw, memberDto.getMember_pw());
		}
		return false;
	}
	//아이디로 번호 받기
	@Override
	public int getNo(String id) {
		return sqlSession.selectOne("member.getNo", id);
	}
	//로그인 시간 갱신
	@Override
	public void updateLoginTime(int no) {
		// TODO Auto-generated method stub
		sqlSession.update("member.updateLoginTime", no);
	}
}
