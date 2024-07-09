package com.kh.secondLife.member.controller;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.secondLife.member.model.vo.Member;
import com.kh.secondLife.member.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.clio.annotations.Debug;

@Controller
@RequestMapping("/member")
@SessionAttributes("loginUser")
@Slf4j
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService mService;
	private final BCryptPasswordEncoder encoder;
	
	@PostMapping("/login")
	public String login(
	        @ModelAttribute Member m,
	        Model model,
	        RedirectAttributes ra
	        ) {
	    System.out.println("로그인 시도: " + m);
	    
	    Member loginUser = mService.login(m);
	    
	    System.out.println("로그인 유저: " + loginUser);
	    
	    String viewName = "";
	    
	    if (loginUser == null || !encoder.matches(m.getPwd(), loginUser.getPwd())) {
	        model.addAttribute("alertMsg", "아이디 또는 비밀번호가 올바르지 않습니다.");
	        viewName = "main";
	    } else {
	        ra.addFlashAttribute("alertMsg", "로그인 성공");
	        model.addAttribute("loginUser", loginUser);
	        
	        viewName = "redirect:/";
	    }
	    return viewName;
	}
	
	
	
	@GetMapping("/signup") 
	public String enrollForm() {
		return "/member/signup";
	}
	

	@PostMapping("/signup")
	public String insertMember(
	        @ModelAttribute Member m,
	        RedirectAttributes ra,
	        Model model
	        ) {

	    System.out.println("Received member: " + m);

	    if (m.getPwd() == null || m.getPwd().isEmpty()) {
	        model.addAttribute("alertMsg", "비밀번호를 입력하세요.");
	        return "signup";
	    }

	    String encPwd = encoder.encode(m.getPwd());
	    m.setPwd(encPwd);

	    int result = mService.insertMember(m);
	    System.out.println(result);

	    if(result > 0) {
	        ra.addFlashAttribute("alertMsg", "회원가입 성공");
	        return "redirect:/"; // 회원가입 성공 시 메인 페이지로 리다이렉트
	    } else {
	        model.addAttribute("alertMsg", "회원가입 실패");
	        return "signup";
	    }
	}
	
	@GetMapping("/idCheck")
    @ResponseBody
    public String idCheck(@RequestParam("id") String id) {
        int result = mService.idCheck(id);
        return result > 0 ? "fail" : "success";
    }
	
	
	@GetMapping("/modify")
	public String modify() {
		return "modify";
	}
	
	
}
