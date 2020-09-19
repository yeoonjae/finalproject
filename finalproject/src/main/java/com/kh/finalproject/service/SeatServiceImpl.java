package com.kh.finalproject.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalproject.entity.SeatDto;
import com.kh.finalproject.repository.SeatDao;

@Service
public class SeatServiceImpl implements SeatService {

	@Autowired
	private SeatDao seatDao;
	
	@Override
	public void regist(String[] seat, int branch_no, String entrance_location) {
//		System.out.println(seat.length);
		for(int i=0; i<seat.length; i++) {
			// 좌석번호 가져오기
			// 1) 두번째 - 의 위치 추출
//			int no_index = seat[i].indexOf('-', 2);
			// 2)그 앞까지 잘라서 좌석번호 추출
//			String seat_location = seat[i].substring(0, no_index);
//			System.out.println(seat_location);
			
			// 나머지 정보 가져오기
			// 1) 좌석번호 뒤부터 나머지 문자열 추출
//			String info = seat[i].substring(no_index+1);
//			System.out.println(info);
			// 2) - 를 기준으로 나누기
//			String[] otherInfo = info.split("-");
//			String seat_type = otherInfo[0];
//			String seat_direction = otherInfo[1];
//			System.out.println(seat_no+", "+seat_type+","+seat_direction);
			
			String[] seatInfo = seat[i].split("-");
			int seat_row = Integer.parseInt(seatInfo[0]);
			int seat_col = Integer.parseInt(seatInfo[1]);
			String seat_type = seatInfo[2];
			String seat_direction = seatInfo[3];
			
			// dto에 정보 등록
			SeatDto seatDto = SeatDto.builder()
								.seat_col(seat_col)
								.seat_row(seat_row)
								.seat_direction(seat_direction)
								.seat_type(seat_type)
								.branch_no(branch_no)
									.build();
			// db에 좌석 등록
			seatDao.regist(seatDto);
		}
		// 출입구 위치 등록
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("entrance_location", entrance_location);
		map.put("branch_no", branch_no);
		seatDao.regist(map);
	}

}
