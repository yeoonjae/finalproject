package com.kh.finalproject.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalproject.entity.MemberBranchDto;
import com.kh.finalproject.entity.PayHisDto;
import com.kh.finalproject.entity.PayInfoDto;
import com.kh.finalproject.entity.PayPointDto;
import com.kh.finalproject.entity.PointHisDto;

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

	//결제 후 마일리지 적립
	@Override
	public void plusPoint(PayPointDto payPointDto) {
		sqlSession.update("pay.plusPoint", payPointDto);
	}

	//결제 후 마일리지 차감 
	@Override
	public void minusPoint(PayPointDto payPointDto) {
		sqlSession.update("pay.minusPoint", payPointDto);	
	}

	// 결제 후 마일리지 차감/적립 정보 등록 
	@Override
	public void payPointRegist(PayPointDto payPointDto) {
		sqlSession.insert("pay.payPointRegist",payPointDto);
		
	}

	// 적립금 디비에 저장
	@Override
	public void registReward(PayPointDto payPointDto) {
		sqlSession.insert("pay.registReward", payPointDto);
	}
	//사용한 마일리지 디비에 저장
	@Override
	public void registUsePoint(PayPointDto payPointDto) {
		sqlSession.insert("pay.registUsePoint", payPointDto);		
	}

	// 회원 보유 시간 충전 
	@Override
	public void addCharge(int member_no,int license_time) {
		Map<Object, Object> map = new HashMap<>();
		map.put("member_no", member_no);
		map.put("license_time",license_time);
		sqlSession.update("pay.addCharge", map);	
	}

	// @@@@@@@@결제 취소 후 @@@@@@@@
	//결제 상태 변경 (결제 완료 -> 결제 취소 )
	@Override
	public void changeStatus(String tid) {
		sqlSession.update("pay.changeStatus", tid);		
	}

	@Override
	public void rePlusPoint(int member_no, int pay_use_point) {
		Map<Object, Object> map = new HashMap<>();
		map.put("member_no", member_no);
		map.put("pay_use_point",pay_use_point);
		sqlSession.update("pay.rePlusPoint", map);
		
	}

	@Override
	public void reMinusPoint(int member_no, int reward) {
		Map<Object, Object> map = new HashMap<>();
		map.put("member_no", member_no);
		map.put("reward",reward);
		sqlSession.update("pay.reMinusPoint", map);
	}

	@Override
	public void reRegistUsePoint(int member_no, int pay_use_point) {
		Map<Object, Object> map = new HashMap<>();
		map.put("member_no", member_no);
		map.put("pay_use_point",pay_use_point);
		sqlSession.insert("pay.reRegistUsePoint", map);
	}

	@Override
	public void reRegistReward(int member_no, int reward) {
		Map<Object, Object> map = new HashMap<>();
		map.put("member_no", member_no);
		map.put("reward",reward);
		sqlSession.insert("pay.reRegistReward", map);
	}

	@Override
	public void minusCharge(int member_no, int license_time) {
		Map<Object, Object> map = new HashMap<>();
		map.put("member_no", member_no);
		map.put("license_time",license_time);
		sqlSession.update("pay.minusCharge", map);	
	}






}
