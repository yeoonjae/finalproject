package com.kh.finalproject.repository;

import java.util.List;

import com.kh.finalproject.entity.MemberBranchDto;
import com.kh.finalproject.entity.MemberCouponDto;
import com.kh.finalproject.entity.PayHisDto;
import com.kh.finalproject.entity.PayInfoDto;
import com.kh.finalproject.entity.PayPointDto;


public interface PayDao {
	
	// 회원 번호로 지점명 조회 
	MemberBranchDto getBranch(int member_no);
	
	//회원번호로 회원보유쿠폰 목록 출력 
	List<MemberCouponDto> coupon_getList(int member_no);
	
	//회원 번호로 회원 이메일 조회 
	String getId(int member_no);
	
	//회원 번호로 회원 포인트 조회 
	int getPoint(int member_no);
	
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
	// 결제 성공 후 회원 보유 시간 update 
	void addCharge(int member_no,int license_time);
	
	// 결제 적립/차감 내역 point_history에 저장
	void registUsePoint(PayPointDto payPointDto);
	void registReward(PayPointDto payPointDto);

	//결제 취소 후 결제 상태 변경 
	void changeStatus(String tid);
	
	//결제 취소 후 마일리지 적립/차감 취소 
	void rePlusPoint(int member_no,int pay_use_point);
	void reMinusPoint(int member_no,int reward);
	
	// 결제 취소 후 적립/차감 내역 point_history에 저장
	void reRegistUsePoint(int member_no,int pay_use_point);
	void reRegistReward(int member_no,int reward);
	
	// 결제 취소 후 회원 보유 시간 차감 
	void minusCharge(int member_no,int license_time);
	
	PayInfoDto getPayDetailInfo(String tid); 
	
	void deleteCoupon(int member_no, int coupon_no);
	void addCoupon(PayInfoDto payInfoDto);
	
}
