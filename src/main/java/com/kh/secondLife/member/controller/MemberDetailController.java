package com.kh.secondLife.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/member")
@Controller
public class MemberDetailController {
	
	@GetMapping("/detail")
	public String memberDetail() {
		return "member/memberDetail";
	}
}
