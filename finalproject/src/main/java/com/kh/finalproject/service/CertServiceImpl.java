package com.kh.finalproject.service;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.kh.finalproject.entity.CertDto;
import com.kh.finalproject.repository.CertDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CertServiceImpl implements CertService{
	private Random r = new Random();
	@Autowired
	private CertDao certDao;
	@Override
	public String generateSecret() {
		int n = r.nextInt(1000000);
		Format f = new DecimalFormat("000000");
		String secret = f.format(n);
		return secret;
	}

	@Override
	public String generateCertification(String ip) {
		String secret = this.generateSecret();
		CertDto certDto = CertDto.builder()
											.who(ip)
											.secret(secret)
										.build();
		certDao.insert(certDto);
		return secret;
	}
	@Override
	@Scheduled(cron = "* * * * * *")
	public void clear() {
//		log.debug("Clear Service 실행!");
		certDao.clearAll();
	}

}
