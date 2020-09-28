package com.kh.finalproject.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalproject.entity.InoutDto;
import com.kh.finalproject.entity.LicenseHisDto;
import com.kh.finalproject.entity.MemberDto;
import com.kh.finalproject.entity.SeatDto;
import com.kh.finalproject.repository.InoutDao;
import com.kh.finalproject.repository.LicenseHisDao;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.SeatDao;

@Service
public class LicenseHisServiceImpl implements LicenseHisService{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private SeatDao seatDao;
	
	@Autowired
	private LicenseHisDao licenseHisDao;
	
	@Autowired
	private InoutDao inoutDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public boolean checkIn(int row, int col, MemberDto memberDto) {
		int branch_no = memberDto.getBranch_no();
		int member_no = memberDto.getMember_no();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("branch_no", branch_no);
		map.put("seat_row", row);
		map.put("seat_col", col);
		SeatDto seatDto = sqlSession.selectOne("seat.check", map);
		
		int check = seatDto.getSeat_state();
		int seat_no = seatDto.getSeat_no();
		if(check==1) { // 이용 가능일 경우
			// 이용 불가로 변경
			seatDao.used(seat_no);

			// 이용 내역 테이블에 정보 업데이트
			LicenseHisDto licenseHisDto = LicenseHisDto.builder()
											.seat_no(seat_no)
											.member_no(member_no)
												.build();
			licenseHisDao.registStart(licenseHisDto);
			
			// 입퇴실 테이블에 입실 내역 추가
			InoutDto inoutDto = InoutDto.builder()
									.member_no(member_no)
									.branch_no(branch_no)
										.build();
			inoutDao.registIn(inoutDto);
			
			return true;
			
		} else {
			
			return false;
		}
		
	}

	@Override
	public boolean checkOut(MemberDto memberDto) {
		int branch_no = memberDto.getBranch_no();
		int member_no = memberDto.getMember_no();
		
		// 이용내역 정보 가져오기
		LicenseHisDto licenseHisDto = licenseHisDao.getUsed(member_no);
		int license_his_no = licenseHisDto.getLicense_his_no();
		int seat_no = licenseHisDto.getSeat_no();
		

		// 이용내역 테이블 종료시간 업데이트
		licenseHisDao.updateFinish(license_his_no);

		// 좌석 이용가능으로 변경
		seatDao.notUsed(seat_no);	
		
		// 입퇴실 테이블 퇴실내역 업데이트
		InoutDto inoutDto = InoutDto.builder()
								.member_no(member_no)
								.branch_no(branch_no)
									.build();
		inoutDao.registOut(inoutDto);
		
		
		// 이용시간 계산 후 충전시간과 비교
		int charge = memberDao.getCharge(member_no); // 충전시간
		int useTime = licenseHisDao.useTime(license_his_no); // 이용시간
		
		// 충전시간이 남아있는 경우
		if(charge > useTime) {
			
			int timeUnit = 10;
			int minusTime = ((useTime+timeUnit-1)/timeUnit)*timeUnit; // 10분 기준으로 차감
			System.out.println("차감 시간 : "+minusTime);
			int member_charge = charge - minusTime; // 잔여시간 구하기
			// 충전시간 업데이트
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("member_no", member_no);
			param.put("member_charge", member_charge);
			memberDao.changeCharge(param);
			
			return true;
			
		// 충전시간이 부족하거나 이용시간과 같은 경우
		} else {
			int timeUnit = 30; // 30분
			int overTime = (useTime - charge + timeUnit - 1) / timeUnit;
			int halfCharge = 1000; // 기준 금액(30분에 1000원씩)
			System.out.println("초과 시간 : "+overTime);
			int price = overTime * halfCharge; // 결제 금액
			System.out.println("금액 : "+price);
			
			// 충전시간 업데이트
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("member_no", member_no);
			param.put("member_charge", 0);
			memberDao.changeCharge(param);
			
			// 결제금액이 있는경우 업데이트
			if(price!=0) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("license_his_pay", price);
				map.put("license_his_no", license_his_no);
				licenseHisDao.updatePay(map);
				
				return false;
				
			} else { // 결제 금액이 없는 경우
				return true;
			}
		}
	}
	
}
