package com.petcare.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class HospitalAuthInterceptor extends HandlerInterceptorAdapter{

	private void saveDestination(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();

		if(query == null || query.equals("null")) {
			query = "";
		}else {
			query = "?" + query;
		}

		if(request.getMethod().equals("GET")) {
			request.getSession().setAttribute("destination", uri + query);
		}
	}

	// controller 전에 생성
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession httpSession = request.getSession();
		
		// session에 "hospital" 이라는 속성이 없으면 /login 페이지로 돌아가 다시 로그인 하도록 함
		if(httpSession.getAttribute("hospital")==null) {
			saveDestination(request);
			response.sendRedirect("/login");
			return false;
		}
		// session "hospital"이라는 속성이 있으면 원래 이동하려던 url로 이동
		return true;
	}
}