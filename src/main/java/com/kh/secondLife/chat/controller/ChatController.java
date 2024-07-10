package com.kh.secondLife.chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.secondLife.chat.model.service.ChatRoomService;
import com.kh.secondLife.chat.model.vo.ChatRoom;
import com.kh.secondLife.member.model.vo.Member;

@Controller
@SessionAttributes({"loginUser"})
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private ChatRoomService chatRoomService;
	
    @GetMapping("/room")
    public String chatRoom() {
        return "chat/chatRoom";
    }
	
    @GetMapping("/room/list")
    public String getChatRoomList(HttpSession session, Model model) {
        User loginUser = (User) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/login";
        }

        // 채팅방 목록 가져오기
        List<ChatRoom> chatRoomList = chatRoomService.getAllChatRooms();
        
        // 목록을 세션에 저장
        session.setAttribute("chatRoomList", chatRoomList);
        session.setAttribute("loginUser", loginUser);
        
        // 모델에 채팅방 목록 추가
        model.addAttribute("chatRoomList", chatRoomList);
        model.addAttribute("loginUser", loginUser);
        
        // 채팅방 목록 페이지로 이동
        return "chat/chatRoomList";
    }
	 
    /**
     * 새로운 채팅방을 생성합니다.
     * @param chatRoom 새로운 채팅방 정보.
     * @return 채팅방 목록 페이지로 리다이렉트.
     */
    @PostMapping("/room/create")
    public String createChatRoom(@ModelAttribute ChatRoom chatRoom) {
        chatRoomService.createChatRoom(chatRoom);
        return "redirect:/chat/room/list";
    }
    
    /**
     * 채팅방을 나가고, 둘 다 나갔는지 체크 후 필요 시 채팅방을 삭제합니다.
     * @param chatRoom 채팅방 정보.
     * @param session HttpSession 객체.
     * @return 성공 여부.
     */
    @PostMapping("/room/leave")
    @ResponseBody
    public String leaveChatRoom(@RequestBody ChatRoom chatRoom, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/login";
        }

        // 채팅방 나가기
        chatRoomService.leaveChatRoom(chatRoom.getChatRoomNo(), loginUser.getMemberNo());
        
        // 둘 다 나갔는지 체크
        boolean isChatRoomEmpty = chatRoomService.isChatRoomEmpty(chatRoom.getChatRoomNo());

        if (isChatRoomEmpty) {
            chatRoomService.deleteChatRoom(chatRoom.getChatRoomNo());
        }

        return "success";
    }
}
