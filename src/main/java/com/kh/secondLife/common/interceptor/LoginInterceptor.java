package com.kh.secondLife.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.secondLife.member.model.vo.Member;

@SessionAttributes({"loginUser"})
public class LoginInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		if(loginUser == null || loginUser.getPwd().isBlank()) {
			response.sendRedirect("/secondlife");
			return false;
		}
			
		return true;
	}
	
}
