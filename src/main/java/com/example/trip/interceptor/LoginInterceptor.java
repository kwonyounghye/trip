package com.example.trip.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	//url 요청 전에 실행되는 코드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		//세션 객체 생성
		HttpSession session = request.getSession();
		//세션 검사, 세션변수 userid가 null
		if(session.getAttribute("id") == null) {
			//세션이 없으면 로그인 페이지로 이동
			response.sendRedirect(request.getContextPath() + "/member/login.do?message=nologin");
			//메인 액션 실행 차단
			return false;
		} else {//메인 액션을 실행함
			return true;
		}
	}
}
