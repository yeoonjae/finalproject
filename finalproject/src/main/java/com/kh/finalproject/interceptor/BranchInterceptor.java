package com.kh.finalproject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.finalproject.entity.AdminDto;

public class BranchInterceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session =request.getSession();
		AdminDto adminDto = (AdminDto)session.getAttribute("admininfo");
		if(adminDto.getAdmin_auth()=="본사") {
			response.sendRedirect(request.getContextPath()+"/admin/admin_index");
			return false;
		}else {
			return true;
		}
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
}
