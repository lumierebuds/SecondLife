package com.kh.secondLife.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.secondLife.board.model.service.BoardService;
import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.common.Pagenation;
import com.kh.secondLife.common.model.vo.PageInfo;
import com.kh.secondLife.member.model.service.MemberService;
import com.kh.secondLife.member.model.vo.Member;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
	
	private final BoardService boardService;
	private final MemberService memberService;
	
	// 게시글 목록 페이지
	@GetMapping("/list")
	public String listBoard(
			@RequestParam(value="pageNo", defaultValue="1") int pageNo,
			@RequestParam Map<String, Object> paramMap,
			Model model
			) {
		
		// (카테고리) 카테고리로 검색할시에 카테고리 이름을 가져와서 뷰에 넘겨주기
		String categoryName = boardService.selectCategoryName(paramMap);
		
		// 1. 전체 게시글 수 조회(페이징 처리)
		int listCount = boardService.selectListCount(paramMap);
		int pageLimit = 10; // 웹 페이지에서 보여지는 페이징바의 개수 
		int boardLimit = 30; // 게시글의 개수 
		
		PageInfo pi = Pagenation.getPageInfo(listCount, pageNo, pageLimit, boardLimit);
		
		// 2. 페이징 처리를 해서 한 페이지에 필요한 게시글만 조회 (최대 30개) 
		List<Board> list= boardService.selectBoardList(pi, paramMap);
		
		model.addAttribute("list",list); // 조회된 게시글 목록
		model.addAttribute("listCount", listCount); // 전체 게시글의 게수  
		model.addAttribute("pi", pi); // 페이지 정보를 담은 페이지 객체 
		model.addAttribute("categoryName", categoryName);
		
		// 3. 현재 페이지에 따라 페이징 바의 색깔을 갈색으로 칠해준다.
		
		return "board/boardListView";
	}
	
	// 게시글 상세 페이지 
	@GetMapping("/detail/{boardNo}")
	public String detailBoard(
			@PathVariable(name="boardNo", required = true) int boardNo,
			@RequestParam Map<String, Object> paramMap,
			Model model
			) {
		
		// 1. 게시글의 내용을 조회하기 		
		Board board = boardService.selectBoard(boardNo);
		int	favCount = boardService.selectBoardFavCount(boardNo);
		
		// 2. 게시글을 작성한 판매자 정보를 조회하기 
		int boardWriter = board.getBoardWriter();
		Member member = memberService.selectMemberInfo(boardWriter);
		Map<String, Integer> salesCount = boardService.getSalesCount(boardWriter);
		int reviewCount = boardService.getReviewCount(boardWriter);
		
		System.out.println(salesCount);
		// 3. 해당 게시글이 참고하는 카테고리의 거래 게시글을 조회하기(최대 4개) 
		int categoryNo = board.getCategoryNo();
		String productName = board.getProductName();
		
		paramMap.put("productName", productName);
		paramMap.put("categoryNo", categoryNo);
			
		List<Board> list = boardService.selectRecommendBoard(paramMap);
		
		// 4. 페이지 렌더링 
		model.addAttribute("board", board);
		model.addAttribute("list", list);
		model.addAttribute("favCount", favCount);
		model.addAttribute("member", member);
		model.addAttribute("salesCount", salesCount);
		model.addAttribute("reviewCount", reviewCount);
		
		return "board/boardDetailView";
	}
	
}
