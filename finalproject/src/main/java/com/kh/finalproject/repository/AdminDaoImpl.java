package com.kh.finalproject.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.AdminDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private PasswordEncoder encoder;
	//관리자 번호 중 가장 큰 값 받아오기
	@Override
	public int getSeq() {
		return sqlSession.selectOne("admin.getSeq");
	}
	//관리자 등록 + 암호화
	@Override
	public void regist(AdminDto adminDto) {
		String enc = encoder.encode(adminDto.getAdmin_pw());
		adminDto.setAdmin_pw(enc);
		sqlSession.insert("admin.regist", adminDto);
	}
	//관리자 로그인
	@Override
	public boolean login(String admin_id, String admin_pw) {
		AdminDto find = sqlSession.selectOne("admin.getLogin", admin_id);
		if (find != null) {
			return encoder.matches(admin_pw, find.getAdmin_pw());
			}
		return false;
	}
	//관리자 정보 조회
	@Override
	public AdminDto get(int admin_no) {
		return sqlSession.selectOne("admin.get",admin_no);
	}
	//관리자  ID로 관리자 번호 받아오기
	@Override
	public int getNo(String admin_id) {
		return sqlSession.selectOne("admin.getNo", admin_id);
	}
	//관리자 수정
	@Override
	public void edit(AdminDto adminDto) {
		 String enc = encoder.encode(adminDto.getAdmin_pw());
		 adminDto.setAdmin_pw(enc);
		sqlSession.update("admin.edit", adminDto);	
	}
	//관리자 삭제
	@Override
	public void delete(int admin_no) {
		// TODO Auto-generated method stub
		sqlSession.delete("admin.delete", admin_no);
	}
	//관리자 리스트 조회
	@Override
	public List<AdminDto> getList() {
		return sqlSession.selectList("admin.list1");
	}
	//관리자 리스트 조회(+순서화)
	@Override
	public List<AdminDto> getList(String col, String order) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("col", col);
		map.put("order", order);
		return sqlSession.selectList("admin.list2", map);
	}
	
	//'지점'관리자 목록
	public List<AdminDto> getBranchAdminList() {
		return sqlSession.selectList("admin.getBranchAdminList");
	}
		
	//관리자 로그인 시간 업데이트
	public void updateLoginTime(int no) {
		sqlSession.selectList("admin.updateLoginTime", no);
	}
	
	// 관리자 지점과 JOIN한 정보 단일 조회
	public AdminDto getAdminInfo(int admin_no) {
		return sqlSession.selectOne("admin.getAdminInfo", admin_no);
	}
	
}
