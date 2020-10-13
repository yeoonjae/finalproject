package com.kh.finalproject.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.finalproject.entity.MemberDto;

public class LoginFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

		MemberDto memberDto = (MemberDto) req.getSession().getAttribute("memberinfo");
		
		if (memberDto != null ) {
			chain.doFilter(request, response);
		} else {
			resp.sendRedirect(req.getContextPath()+"/member/account/login");
		}
	}
}
