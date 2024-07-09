package com.kh.secondLife.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	// 게시글 목록 페이지
	@GetMapping("/list")
	public String listBoard() {
		return "board/boardListView";
	}
}
