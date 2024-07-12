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
import org.springframework.web.bind.annotation.SessionAttribute;
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
    public String chatRoom(@SessionAttribute("loginUser") Member loginUser, Model model) {
        if (loginUser != null) {
            int memberNo = loginUser.getMemberNo();
            List<ChatRoom> chatRoomList = chatRoomService.getChatRoomsByMemberNo(memberNo);
            model.addAttribute("chatRoomList", chatRoomList);
            model.addAttribute("loginUser", loginUser);
        } else {
            return "redirect:/member/login";
        }
        return "chat/chatRoom";
    }
    
    @GetMapping("/room/list")
    public String getChatRoomList(HttpSession session, Model model) {
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/member/login";
        }

        List<ChatRoom> chatRoomList = chatRoomService.getAllChatRooms();
        session.setAttribute("chatRoomList", chatRoomList);
        session.setAttribute("loginUser", loginUser);
        model.addAttribute("chatRoomList", chatRoomList);
        model.addAttribute("loginUser", loginUser);
        return "chat/chatRoomList";
    }
    
    @PostMapping("/room/create")
    public String createChatRoom(@ModelAttribute ChatRoom chatRoom) {
        chatRoomService.createChatRoom(chatRoom);
        return "redirect:/chat/room/list";
    }
    
    @PostMapping("/room/leave")
    @ResponseBody
    public String leaveChatRoom(@RequestBody ChatRoom chatRoom, HttpSession session) {
        Member loginUser = (Member) session.getAttribute("loginUser");

        if (loginUser == null) {
            return "redirect:/member/login";
        }

        chatRoomService.leaveChatRoom(chatRoom.getChatRoomNo(), loginUser.getMemberNo());
        boolean isChatRoomEmpty = chatRoomService.isChatRoomEmpty(chatRoom.getChatRoomNo());

        if (isChatRoomEmpty) {
            chatRoomService.deleteChatRoom(chatRoom.getChatRoomNo());
        }

        return "success";
    }
}