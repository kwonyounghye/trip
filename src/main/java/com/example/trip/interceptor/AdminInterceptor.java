package com.example.trip.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	//요청전에 실행
	@Override
					//전처리
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		//관리자 세션 검사
		if (session.getAttribute("admin") == null) {//로그아웃 상태
			//로그인 화면으로 이동													//파라미터로 값 보냄
			response.sendRedirect(request.getContextPath() + "/admin/login.do?message=nologin");
			return false;//요청을 더이상 실행하지 않음
		} else {//로그인 상태
			return true;//요청을 실행함(메인 액션으로 이동)
		}
	}
}
