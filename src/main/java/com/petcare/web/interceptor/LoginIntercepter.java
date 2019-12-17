package com.petcare.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.petcare.web.domain.UserVO;

public class LoginIntercepter extends HandlerInterceptorAdapter {

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        
    	// loginPro에서 model 객체에 "user" 이름으로 저장한 값 가져옴
    	UserVO user = (UserVO) modelAndView.getModel().get("user");

    	// user에 값이 있으면 session에 "hospital"이라는 속성 추가
        if(user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            Object destination = session.getAttribute("destination");
            response.sendRedirect(destination != null ? (String) destination : "/");
        }

    }
}