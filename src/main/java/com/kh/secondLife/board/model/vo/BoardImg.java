package com.kh.secondLife.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardImg {

	private int boardImgNo; // 거래글 사진 번호
	private int boardNo; // 거래글 번호
	private String changeName; // 저장된 이름
	private String imgPath; // 저장된 공간의 상대주소
	private String status; // 유효 여부 [기본값 : 'Y']
	private Date createDate; // 생성 날짜 [기본값 : SYSDATE]
	private Date modifyDate; // 수정 날짜 [기본값 : SYSDATE]
	
}

