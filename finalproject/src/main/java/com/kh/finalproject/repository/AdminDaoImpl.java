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

	@Override
	public int getSeq() {
		return sqlSession.selectOne("admin.getSeq");
	}
	@Override
	public void regist(AdminDto adminDto) {
		String enc = encoder.encode(adminDto.getAdmin_pw());
		adminDto.setAdmin_pw(enc);
		sqlSession.insert("admin.regist", adminDto);
	}
	@Override
	public boolean login(String admin_id, String admin_pw) {
		AdminDto find = sqlSession.selectOne("admin.getLogin", admin_id);
		if (find != null) {
			boolean pass = encoder.matches(admin_pw, find.getAdmin_pw());
			if (pass) {
				return true;
			}
		}
		return false;
	}
	@Override
	public AdminDto get(int admin_no) {
		return sqlSession.selectOne("admin.get",admin_no);
	}
	@Override
	public int getNo(String admin_id) {
		return sqlSession.selectOne("admin.getNo", admin_id);
	}
	@Override
	public void edit(AdminDto adminDto) {
		 String enc = encoder.encode(adminDto.getAdmin_pw());
		 adminDto.setAdmin_pw(enc);
		sqlSession.update("admin.edit", adminDto);	
	}
	@Override
	public void delete(int admin_no) {
		// TODO Auto-generated method stub
		sqlSession.delete("admin.delete", admin_no);
	}
	@Override
	public List<AdminDto> getList() {
		return sqlSession.selectList("admin.list1");
	}
	@Override
	public List<AdminDto> getList(String col, String order) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("col", col);
		map.put("order", order);
		return sqlSession.selectList("admin.list2", map);
	}
	@Override
	public void updateLoginTime(int no) {
		sqlSession.selectList("admin.updateLoginTime", no);
	}
	
}
