package com.petcare.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.petcare.web.domain.Hospital;

public class HospitalLoginInterceptor extends HandlerInterceptorAdapter {
		// preHandle() : 컨트롤러보다 먼저 수행되는 메서드
	@Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        
    	Hospital hospital = (Hospital) modelAndView.getModel().get("hospital");

        if(hospital != null) {
            HttpSession session = request.getSession();
            session.setAttribute("hospital", hospital);
            Object destination = session.getAttribute("destination");
            response.sendRedirect(destination != null ? (String) destination : "/");
        }
	}
}