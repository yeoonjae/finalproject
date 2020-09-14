package com.kh.finalproject.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ScheduleSeriviceImpl implements ScheduleService{

	@Autowired
	private SqlSession sqlSession;
	
	//매일 자정마다 연결테이블에 없는 메세지들 삭제
	@Scheduled(cron = "0 0 0 * * *")//매일 자정마다
	public void messageAutoDelete() {
		sqlSession.delete("message.messageAutoDelete");
	}

}
