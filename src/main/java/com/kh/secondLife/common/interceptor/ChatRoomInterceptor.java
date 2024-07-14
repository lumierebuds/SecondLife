package com.kh.secondLife.common.interceptor;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.secondLife.chat.model.service.ChatService;
import com.kh.secondLife.chat.model.vo.ChatRoom;
import com.kh.secondLife.member.model.vo.Member;

public class ChatRoomInterceptor implements HandlerInterceptor {
	
	@Autowired
	private ChatService chatService;
	
	@Autowired
	private ServletContext application;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Member loginUser =  (Member) session.getAttribute("loginUser");
		
		if(session.getAttribute("chatRoomList") == null) {
			// DB에서 chatRoomList 조회 후
			List<ChatRoom> chatRoomList = chatService.getChatRoomsByMemberNo(loginUser.getMemberNo());
			// session 영역에 저장.
			// session에 저장된 데이터는 이후 model의 세션 영역에 이관 후 
			// HttpSession 영역에서는 삭제.
			
			// 공통적으로 사용할 contextPath 저장
			application.setAttribute("contextPath", request.getContextPath());
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
