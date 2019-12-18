package com.petcare.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.petcare.web.domain.Hospital;

public class HospitalLoginInterceptor extends HandlerInterceptorAdapter {
	
	// 컨트롤러에서 loginPro2에서 view로 넘어갈 때 동작
	@Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        
		// loginPro2에서 model 객체에 "hospital" 이름으로 저장한 값 가져옴
    	Hospital hospital = (Hospital) modelAndView.getModel().get("hospital");
    	
    	// hospital에 값이 있으면 session에 "hospital"이라는 속성 추가
        if(hospital != null) {
            HttpSession session = request.getSession();
            session.setAttribute("hospital", hospital);
            Object destination = session.getAttribute("destination");
            response.sendRedirect(destination != null ? (String) destination : "/");
        }
	}
}