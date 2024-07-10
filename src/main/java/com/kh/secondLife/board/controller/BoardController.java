package com.kh.secondLife.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.secondLife.board.model.service.BoardService;
import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.board.model.vo.BoardExt;
import com.kh.secondLife.board.model.vo.BoardImg;
import com.kh.secondLife.common.Utils;
import com.kh.secondLife.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller // 이게 있어야 bean객체로 등록
@Slf4j
@SessionAttributes({"loginUser"})
@RequestMapping("/board")
public class BoardController {
	
	// 게시글 목록 페이지
	@GetMapping("/list")
	public String listBoard() {
		return "board/boardListView";
	}
	
	/*------------------------------게시글 등록/수정------------------------------*/
	// 게시글 등록 페이지
	@GetMapping("/insert")
	public String enrollBoard() {
		return "board/boardEnrollForm";
	}
	
	// 게시글 등록 페이지 -> 게시글 등록 버튼 눌렀을 때
	@PostMapping("/insert")
	public String insertBoard(
			Board b ,
			@ModelAttribute("loginUser") Member loginUser,
			Model model , // errorMsg
			RedirectAttributes ra, // alertMsg
			//첨부파일
			@RequestParam(value="upfile", required=false) MultipartFile upfile // 항상 객체 생성
			) {
		// 업무로직
		// 1) 웹서버에 클라이언트가 전달한 FILE저장
		BoardImg bi = null;
		if(upfile != null && !upfile.isEmpty()) {
			//첨부파일, 이미지등을 저장할 저장경로 얻어오기.
			String webPath = "/resources/images/board/";
			String serverFolderPath = application.getRealPath(webPath);
			
			//디렉토리가 존재하지 않는다면 생성하는 코드 추가
			File dir = new File(serverFolderPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			// 사용자가 등록한 첨부파일의 이름을 수정
			String changeName = Utils.saveFile(upfile, serverFolderPath);
			
			bi = new BoardImg();
			bi.setChangeName(changeName);
		}
		
		// 2) 저장 완료시 파일이 저장된 경로를 BOARD_IMG에 등록후 테이블에 추가
		// -> 1) Board INSERT
		// -> 2) BOARD_IMG INSERT -> 클라이언트가 upfile에 데이터를 작성했을때만.
		log.debug("board : {}" , b); // Board(boardNo=0, categoryNo=0, boardWriter=홍길동, ...)
		// boardWriter 추가
		b.setBoardWriter(loginUser.getMemberNo());
		
		int result = 0;
		try {
			result = boardService.insertBoard(b, bi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// 3) 반환값을 통해 메세지 등록
		String url = "";
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "글 작성 성공");
			url = "redirect:/board/detail/"+b.getBoardNo();
		}else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			url = "common/errorPage";
		}
		// 4) 응답페이지 설정
		return url;
	}
	
//	// 게시글 수정 페이지
//	@GetMapping("/update/{boardNo}")
//	public String updateBoard(
//			@PathVariable("boardCode") String boardCode,
//			@PathVariable("boardNo") int boardNo,
//			Model model
//			) {
//		// 작성했던 게시글 정보가 보이게 한후, 모델에 담아서 포워딩
//		BoardExt board = (BoardExt) boardService.selectBoard(boardNo);
//		// 게시글 본문내용 변경 <br> -> \n
//		board.setBoardContent(Utils.newLineClear(board.getBoardContent()));
//		
//		model.addAttribute("board", board);
//		
//		return "board/boardUpdateForm";
//	}
//	
//	// 게시글 수정 페이지 -> 게시글 수정 버튼 눌렀을 때
//	@PostMapping("/update/{boardNo}")
//	public String updateBoard2(
//			@PathVariable("boardCode") String boardCode,
//			@PathVariable("boardNo") int boardNo,
//			Model model,
//			Board board, // 저장할 게시판 데이터
//			RedirectAttributes ra,
//			// 첨부파일
//			@RequestParam(value="upfile", required = false) MultipartFile upfile,
//			int boardImgNo,
//			String deleteList // 일반게시판 1, 사진게시판 1,2,3
//			) {
//		// 업무로직
//		// BOARD테이블 수정하고
//		log.debug("board ? {} , boardImgNo ? {}" , board, boardImgNo);
//		
//		// upfile에 전달된 IMG이 있으면 이미지테이블 수정 , 추가
//		// 사진이 없던곳에서 새롭게 추가된경우 -> INSERT
//		// 사진이 있던곳에서 새롭게 추가된경우 -> UPDATE
//		// 사진이 있던곳에서 삭제가 된경우 -> DELETE
//		// 원래 사진이 없었고, 추가된 것도 없는 경우 -> 아무것도 안함.
//		int result = 0;
//		
//		result = boardService.updateBoard(board, upfile, boardImgNo, deleteList);
//		
//		if(result > 0) {
//			ra.addFlashAttribute("alertMsg", "게시글 수정 성공");
//			// 작업성공시 리다이렉트
//			return "redirect:/board/detail/" + boardCode + "/" + boardNo;
//		}else {
//			model.addAttribute("errorMsg", "게시글 수정 실패");
//			return "common/errorPage";
//		}
//		
//	}
	/*------------------------------게시글 등록/수정 끝------------------------------*/
}
