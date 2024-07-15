package com.kh.secondLife.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.secondLife.chat.model.service.ChatService;
import com.kh.secondLife.chat.model.vo.ChatMessage;
import com.kh.secondLife.chat.model.vo.ChatRoom;
import com.kh.secondLife.chat.model.vo.ChatRoomExt;
import com.kh.secondLife.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes({"loginUser", "chatRoomList"})
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private ChatService chatService;
    

    @GetMapping("/room")
    public String chatRoom(Model model) {
    	
    	Member loginUser = (Member) model.getAttribute("loginUser");
    	
    	// 이 때 전송하는 chatRoomList에는 채팅방 정보 뿐만 아니라, 상대 회원 닉네임과 상품명도 필요
    	List<ChatRoomExt> chatRoomList = chatService.selectMemberChatRoomList(loginUser.getMemberNo());
    	
    	model.addAttribute("chatRoomList", chatRoomList);
    	
        return "chat/chatRoom";
    }
    
    @PostMapping("/room/insert")
    @ResponseBody
    public int insertChatRoom(ChatRoom chatRoom, Model model) {
    	
    	Member loginUser = (Member) model.getAttribute("loginUser");
    	
    	// 채팅을 신청하는 측일 때 FirstMemberNo에 담김
    	chatRoom.setFirstMemberNo(loginUser.getMemberNo());
    	
    	log.debug("chatRoom 값 - {}", chatRoom);
    	
        int result = chatService.insertChatRoom(chatRoom);
        
        return result;
    }
    
    @PostMapping("/room/leave/{chatRoomNo}")
    @ResponseBody
    public int leaveChatRoom(
    		@PathVariable int chatRoomNo,
    		Model model
    		) {
    	
        Member loginUser = (Member) model.getAttribute("loginUser");

        Map<String, Object> paramMap = new HashMap<>();
        
        paramMap.put("chatRoomNo", chatRoomNo);
        paramMap.put("memberNo", loginUser.getMemberNo());
        
        // leaveChatRoom에 들어갈 값 => chatRoomNo, 나갈 회원의 mebmerNo
        int result = chatService.leaveChatRoom(paramMap);
        
        int count = chatService.countChatRoomMember(chatRoomNo);
        
        if (count == 0) {
        	// 정말 없애는 게 아니라, STATUS를 N으로 전환
            result *= chatService.deleteChatRoom(chatRoomNo);
        }

        return result;
    }
    
    @PostMapping("/room/{chatRoomNo}")
    @ResponseBody
    public List<ChatMessage> accessChatRoom(
    		@PathVariable int chatRoomNo
    		) {
    	List<ChatMessage> list = chatService.selectChatMessageList(chatRoomNo);
    	
    	return list;
    }
}