package com.kh.secondLife.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.secondLife.admin.service.AdminService;
import com.kh.secondLife.board.model.service.BoardService;
import com.kh.secondLife.board.model.vo.Board;

import com.kh.secondLife.common.Pagenation;
import com.kh.secondLife.common.model.vo.PageInfo;
import com.kh.secondLife.member.model.service.MemberService;
import com.kh.secondLife.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginAdmin"})
@RequiredArgsConstructor
public class AdminController {
	
	private final AdminService aService;

	private final BoardService bService;
	
	private final MemberService mService;
	
	private final BCryptPasswordEncoder encoder;
	
	// 회원관리 페이지
	@GetMapping("/memberManage/{pageNo}")
	public String memberManage(
			@PathVariable /* (name = "pageNo") */ int pageNo,
			Model model,
			@RequestParam Map<String, Object> paramMap
			) {
		
		// 페이징 작업처리 순서
		
		// 1 - 총 회원수가 필요하다
		int listCount = aService.selectMemberAllCount(paramMap);
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagenation.getPageInfo(listCount, pageNo, pageLimit, boardLimit);
		// pi : 현재 페이지, 현재 페이지에서의 페이징 바의 첫번째와 마지막 페이지,
		//      한 페이지 당 표시할 보드 갯수, 모든 보드 갯수, 가장 마지막 페이지 등의 정보를 가진 객체
		
		// 1 - 회원 데이터 조회 후
		// 1-1 모든 회원 조회
		List<Member> mList = aService.selectMemberAll(pi, paramMap);
		
		
		// 3 - 응답 view페이지에 회원 데이터 삽입
		// 3-1 조회한 모든 회원 정보 model에 넣기
		model.addAttribute("mList", mList);
		model.addAttribute("memberCount", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("searchCategory", paramMap.get("searchCategory"));
		model.addAttribute("searchKeyword", paramMap.get("searchKeyword"));
		
		// 4 - jsp에게 페이지 생성 위임
		return "admin/memberManage";
	}
	
	

	// 게시글 관리
	@GetMapping("/postManage/{pageNo}")
	public String postManage(
			@PathVariable /* (name = "pageNo") */ int pageNo,
			Model model,
			@RequestParam Map<String, Object> paramMap
			) {
		log.debug("프론트에서 넘겨받은 값 - {}", paramMap);
		// 페이징 처리 부분.
		int listCount = bService.selectBoardListCount(paramMap);
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagenation.getPageInfo(listCount, pageNo, pageLimit, boardLimit);
		
		List<Board> bList = aService.selectManageBoardList(pi, paramMap);
		
		model.addAttribute("bList", bList);
		model.addAttribute("boardCount", listCount);
		model.addAttribute("pi", pi);
		model.addAttribute("searchCategory", paramMap.get("searchCategory"));
		model.addAttribute("searchKeyword", paramMap.get("searchKeyword"));

		
		return "admin/postManage";
	}
	

	
	// 신고 관리
	@GetMapping("/reportManage")
	public String reportManage() {
		return "admin/reportManage";
	}
	
	
	// 회원 삭제
	 @PostMapping("/deleteMember")
	 @ResponseBody
	 public Map<String, Object> deleteMember(
			 @RequestParam("id") String memberId
			 ) {
		 
	     Map<String, Object> response = new HashMap<>();

	     try {
	         boolean isDeleted = mService.deleteMemberById(memberId);
	         if (isDeleted) {
	             response.put("success", true);
	             response.put("message", "회원을 삭제했습니다.");
	         } else {
	             response.put("success", false);
	             response.put("message", "회원 삭제에 실패했습니다.");
	         }
	     } catch (Exception e) {
	         response.put("success", false);
	         response.put("message", "오류가 발생했습니다: " + e.getMessage());
	     }

	     return response;
	 }
	 
	 @PostMapping("/deleteBoard")
	 @ResponseBody
	 public Map<String, Object> deleteBoard(
			 @RequestParam("boardNo") int boardNo
			 ){
		 
		 Map<String, Object> response = new HashMap<>();
		 
		 try {
			 boolean isDeleted = bService.deleteBoardByNo(boardNo);
			 if(isDeleted) {
				 response.put("success", true);
				 response.put("message", "게시글을 삭제했습니다.");
			 }else {
				 response.put("success", false);
				 response.put("message", "게시글 삭제에 실패했습니다.");
			 }
		 }catch(Exception e) {
			 response.put("success", false);
			 response.put("message", "오류가 발생했습니다: " + e.getMessage());
		 }
		 
		 return response;
	 }
	 
	
	
}
