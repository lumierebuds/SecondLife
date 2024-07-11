package com.kh.secondLife.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.secondLife.admin.service.AdminService;
import com.kh.secondLife.board.model.service.BoardService;
import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.common.Pagenation;
import com.kh.secondLife.common.model.vo.PageInfo;
import com.kh.secondLife.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@SessionAttributes({"loginAdmin"})
@RequiredArgsConstructor
public class AdminController {
	
	private final AdminService aService;
	
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
	@GetMapping("/postManage")
	public String postManage(
			Model model,
			@RequestParam Map<String, Object> paramMap
			) {
		
		List<Board> bList = aService.selectBoardList(null, paramMap);
		
		model.addAttribute("aList", bList);
		
		return "admin/postManage";
	}
	
	
	// 신고 관리
	@GetMapping("/reportManage")
	public String reportManage() {
		return "admin/reportManage";
	}
	
	
	
}
