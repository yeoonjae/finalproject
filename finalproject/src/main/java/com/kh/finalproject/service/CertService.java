package com.kh.finalproject.service;

public interface CertService{

	String generateCertification(String ip);

	String generateSecret();

	void clear();

}
