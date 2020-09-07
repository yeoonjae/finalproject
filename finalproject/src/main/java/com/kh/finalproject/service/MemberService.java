package com.kh.finalproject.service;

import javax.servlet.http.HttpSession;

public interface MemberService {
	boolean check(String pw, HttpSession session);
}
