package com.kh.secondLife.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.secondLife.admin.service.AdminService;
import com.kh.secondLife.board.model.service.BoardService;
import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginAdmin"})
@RequiredArgsConstructor
public class AdminController {
	
	private final AdminService aService;
	
	private final BCryptPasswordEncoder encoder;
	
	@GetMapping("/memberManage")
	public String memberManage(Model model) {
		// 업무 내용
		// 1. 모든 회원 조회
		List<Member> mList = aService.selectMemberAll();
		
		// 2. 조회한 모든 회원 정보 model에 넣기
		model.addAttribute("mList", mList);
		
		// 3. jsp에게 페이지 생성 위임
		return "admin/memberManage";
	}
	
	
	
	@GetMapping("/postManage")
	public String postManage(
			Model model,
			@RequestParam Map<String, Object> paramMap
			) {
		
		List<Board> bList = aService.selectBoardList(null, paramMap);
		
		model.addAttribute("aList", bList);
		
		return "admin/postManage";
	}
	
	@GetMapping("/reportManage")
	public String reportManage() {
		return "admin/reportManage";
	}
	
	
	
}
