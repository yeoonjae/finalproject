package com.kh.finalproject.repository;

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
	public void regist(AdminDto adminDto) {
			//String enc = encoder.encode(adminDto.getAdmin_pw());
			//adminDto.setAdmin_pw(enc);
			sqlSession.insert("admin.regist", adminDto);
		}
	
	} 
