package com.kh.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalproject.VO.PagingVO;
import com.kh.finalproject.entity.MemberCouponDto;

@Service
public class MemberCouponServiceImpl implements MemberCouponService{

	@Autowired
	private SqlSession sqlSession;
	@Override
	public int countCoupon(int member_no) {
		return sqlSession.selectOne("memberCoupon.countCoupon", member_no);
	}

	@Override
	public List<MemberCouponDto> selectCoupon(int member_no, PagingVO vo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_no", member_no);
		param.put("start", vo.getStart());
		param.put("end", vo.getEnd());
		return sqlSession.selectList("memberCoupon.selectCoupon", param);
	}

}
