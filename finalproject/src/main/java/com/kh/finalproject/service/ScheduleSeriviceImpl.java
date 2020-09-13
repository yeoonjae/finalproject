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
	
	
	@Scheduled(cron = "0 0 0 * * *")//매일 자정마다
	public void messageAutoDelete() {
		log.info("실행실행실행");
		sqlSession.delete("message.messageAutoDelete");
		log.info("삭제완료");
	}

}
