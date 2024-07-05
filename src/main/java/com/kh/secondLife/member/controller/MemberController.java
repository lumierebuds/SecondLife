package com.kh.secondLife.member.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.secondLife.member.model.vo.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private MemberService mService;
	private BCryptPasswordEncoder encoder; 
	
	public MemberController(MemberService mService , BCryptPasswordEncoder encoder) {
		this.mService = mService;
		this.encoder = encoder;
	}
	
	
	public String insertMember(
			Member m,
			RedirectAttributes ra,
			Model model // request
			) {
		
		String encPwd = encoder.encode(m.getpwd());
		
		
	}
	
	
	
}
