package com.kh.secondLife.admin.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.secondLife.admin.service.AdminService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginAdmin"})
@RequiredArgsConstructor
public class AdminConrtoller {
	
	private final AdminService aService;
	private final BCryptPasswordEncoder encoder;
	
	@GetMapping("/memberManage")
	public String memberManage() {
		return "admin/memberManage";
	}
	
	
	
	@GetMapping("/postManage")
	public String postManage() {
		return "admin/postManage";
	}
	
	@GetMapping("/reportManage")
	public String reportManage() {
		return "admin/reportManage";
	}
	
	
	
}
