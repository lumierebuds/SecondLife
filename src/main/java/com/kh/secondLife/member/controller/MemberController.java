package com.kh.secondLife.member.controller;

import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.secondLife.member.model.vo.Member;
import com.kh.secondLife.member.model.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
@SessionAttributes({"loginUser"})
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService mService;
	private final BCryptPasswordEncoder encoder; 
	

	@PostMapping("/login")
	public String login(
	        @ModelAttribute Member m,
	        Model model,
	        RedirectAttributes ra,
	        HttpSession session
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

			log.debug("로그인 한 유저 정보 - {}", loginUser);
			viewName = "redirect:/";
			if (loginUser.getAdminAuth().equals("Y")) {
				viewName += "admin/memberManage";
			}

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
		return "/member/modify";
	}
	
	
	@PostMapping("/modify")
	public String updateMember(
	        @ModelAttribute Member m,
	        @RequestParam(name = "newPwd", required = false) String newPwd,
	        Model model,
	        RedirectAttributes ra,
	        SessionStatus status
	) {
	    // 비밀번호 변경 여부 확인
	    if (newPwd != null && !newPwd.isEmpty()) {
	        // 새 비밀번호를 암호화하여 설정
	        String encPwd = encoder.encode(newPwd);
	        m.setPwd(encPwd);
	    } else {
	        // 비밀번호 변경하지 않을 경우 기존 비밀번호 유지
	        Member loginUser = (Member) model.getAttribute("loginUser");
	        m.setPwd(loginUser.getPwd());
	    }

	    int result = mService.updateMember(m);

	    if (result > 0) {
	        // 성공 시 로그인 정보 갱신
	        status.setComplete(); // model의 session 영역 삭제
	        ra.addFlashAttribute("alertMsg", "회원정보 수정 성공, 다시 로그인해주세요.");
	        return "redirect:/";
	    } else {
	        model.addAttribute("alertMsg", "정보 수정 실패...");
	        return "redirect:/member/myPage";
	    }

	}
	
	@GetMapping("/logout")
	@ResponseBody
	public String logout(HttpSession session, SessionStatus status) {
		System.out.println("로그아웃 시도");
        session.invalidate();
        status.setComplete();
        System.out.println("세션 무효화 완료");
        return "success";
	}
	
	
	@PostMapping("/delete")
    public String deleteMember(@RequestParam("id") String id, HttpSession session, SessionStatus status, RedirectAttributes ra) {
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser != null && loginUser.getId().equals(id)) {
            int result = mService.deleteMember(id);
            if (result > 0) {
                session.invalidate(); // 세션 무효화
                status.setComplete(); // @SessionAttributes 해제
                ra.addFlashAttribute("alertMsg", "회원탈퇴가 완료되었습니다.");
                return "redirect:/";
            } else {
                ra.addFlashAttribute("alertMsg", "회원탈퇴 실패");
                return "redirect:/member/myPage";
            }
        } else {
            ra.addFlashAttribute("alertMsg", "잘못된 접근입니다.");
            return "redirect:/member/myPage";
        }
    }
	
	@GetMapping("/findId")
	@ResponseBody
	public String findId(@RequestParam("email") String email) {
	    String id = mService.findIdByEmail(email);
	    System.out.println(id);
	    return id != null ? id : "fail";
	}
	

	@GetMapping("/myPage")
	public String myPage() {
		return "/member/myPage";
	}
	
	@GetMapping("/sell")
	public String sell() {
		return "/member/sell";
	}
	
	@GetMapping("/basket")
	public String basket() {
		return "member/basket";
	}
	
	@GetMapping("/buy")
	public String buy() {
		return "member/buy";
	}
	
	@GetMapping("/review")
	public String review() {
		return "member/review";
	}
	
	@GetMapping("/review/insert")
	public String insertReview() {
		return "review/insertReview";
	}
	
}
