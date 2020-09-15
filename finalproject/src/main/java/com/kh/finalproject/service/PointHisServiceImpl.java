package com.kh.finalproject.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalproject.entity.PointHisDto;
import com.kh.finalproject.repository.MemberDao;
import com.kh.finalproject.repository.PointHisDao;

@Service
public class PointHisServiceImpl implements PointHisService{

	@Autowired
	private PointHisDao pointHisDao;
	
	@Autowired
	private MemberDao memberDao;

	// 마일리지 내역 등록
	@Override
	public void regist(PointHisDto pointHisDto) {
		int point_his_no = pointHisDao.getSeq();
		pointHisDto.setPoint_his_no(point_his_no);
		
		int point_no = pointHisDto.getPoint_no();
		
		if(point_no == 1) { // 관리자 적립일 경우
			memberDao.plusPoint(pointHisDto); // 마일리지 적립
		} else { // 관리자 차감일 경우
			memberDao.minusPoint(pointHisDto); // 마일리지 차감
		}
		
		// 마일리지 내역 등록
		pointHisDao.regist(pointHisDto);
	}

	@Override
	public List<PointHisDto> getList(int member_no, String start, String finish) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("member_no", member_no);
		param.put("start", start);
		param.put("finish", finish);
		
		return pointHisDao.getList(param);
	}
	
	
}
