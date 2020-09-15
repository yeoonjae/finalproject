package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.MemberBranchDto;
import com.kh.finalproject.entity.PayHisDto;
import com.kh.finalproject.entity.PayInfoDto;
import com.kh.finalproject.entity.PayPointDto;
import com.kh.finalproject.entity.PointHisDto;

public interface PayDao {
	
	// 회원 번호로 지점명 조회 
	MemberBranchDto getBranch(int member_no);
	
	//회원 번호로 회원 이메일 조회 
	String getId(int member_no);
	
	// 카카오페이 주문번호 시퀀스 생성 
	int getOrderSeq();
	
	//결제 정보 저장 
	void payInfoInsert(PayHisDto payHisDto);
	
	// 회원 번호로 회원 결제 내역 조회 
	List<PayInfoDto> getPayInfo(int member_no);
	
	void plusPoint(PayPointDto payPointDto );
	void minusPoint(PayPointDto payPointDto);
	
	//결제 승인후 마일리지 정보 임시 저장 
	void payPointRegist(PayPointDto payPointDto);

	
	//번호 뽑기
	int getSeq();

	// 결제 적립/차감 내역 point_history에 저장
	void registUsePoint(PayPointDto payPointDto);
	void registReward(PayPointDto payPointDto);
	
}
