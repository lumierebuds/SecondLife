package com.kh.secondLife.board.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.secondLife.board.model.service.BoardService;
import com.kh.secondLife.board.model.vo.Board;
import com.kh.secondLife.board.model.vo.BoardImg;
import com.kh.secondLife.common.Utils;
import com.kh.secondLife.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller // 이게 있어야 bean객체로 등록
@Slf4j
@SessionAttributes({"loginUser"})
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {

	private final BoardService boardService;
	private final ServletContext application;
	private final ResourceLoader resourceLoader;
	
	@GetMapping("/insert")
	public String enrollBoard(/*@PathVariable("boardCode") String boardCode*/) {
		return "board/boardEnrollForm";
	}
	
	@PostMapping("/insert")
	public String insertBoard(
			@PathVariable("boardCode") String boardCode,
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
			String webPath = "/resources/images/board/"+boardCode+"/";
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
			bi.setOriginName(upfile.getOriginalFilename());
			bi.setImgLevel(0); // 0 첨부파일 1은 썸네일 그외는 상세보기용 이미지
		}
		
		// 2) 저장 완료시 파일이 저장된 경로를 BOARD_IMG에 등록후 테이블에 추가
		// -> 1) Board INSERT
		// -> 2) BOARD_IMG INSERT -> 클라이언트가 upfile에 데이터를 작성했을때만.
		log.debug("board : {}" , b); // Board(boardNo=0, boardTitle=asdasd, boardContent=asd, boardWriter=null, count=0, createDate=null, status=null, boardCd=null)
		// boardWriter , boardCd 추가
		b.setBoardCd(boardCode); // pathvariable추가
		b.setBoardWriter(String.valueOf(loginUser.getUserNo()));
		
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
			url = "redirect:/board/detail/"+boardCode+"/"+b.getBoardNo();
		}else {
			model.addAttribute("errorMsg", "게시글 작성 실패");
			url = "common/errorPage";
		}
		// 4) 응답페이지 설정
		return url;
	}
}