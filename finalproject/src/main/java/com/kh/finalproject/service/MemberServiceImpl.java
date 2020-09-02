package com.kh.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.repository.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	// 회원 검색
	@Override
	public List<MemberDto> search(String member_name, int branch_no) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_name", member_name);
		param.put("branch_no", branch_no);
		
		return memberDao.search(param);
	}

}
