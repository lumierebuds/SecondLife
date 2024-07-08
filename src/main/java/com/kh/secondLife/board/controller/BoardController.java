package com.kh.secondLife.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.secondLife.board.model.service.BoardService;
import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.common.Pagenation;
import com.kh.secondLife.common.model.vo.PageInfo;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
	
	private final BoardService boardService;
	
	// 게시글 목록 페이지
	@GetMapping("/list")
	public String listBoard(
			@RequestParam(value="pageNo", defaultValue="1") int pageNo,
			@RequestParam(required = false) Map<String, Object> paramMap,
			Model model
			) {
			
		// 1. 전체 게시글 수 조회(페이징 처리)
		int listCount = boardService.selectListCount();
		int pageLimit = 10; // 웹 페이지에서 보여지는 페이징바의 개수 
		int boardLimit = 30; // 게시글의 개수 
		
		System.out.println(pageNo);
		System.out.println(listCount);
		
		PageInfo pi = Pagenation.getPageInfo(listCount, pageNo, pageLimit, boardLimit);
		
		// 2. 페이징 처리를 해서 한 페이지에 필요한 게시글만 조회 (최대 30개) 
		List<Board> list= boardService.selectBoardList(pi);
		
		System.out.println(list);
		model.addAttribute("list",list);
		
		// 3. 현재 페이지에 따라 페이징 바의 색깔을 갈색으로 칠해준다.
		
		return "board/boardListView";
	}
}
