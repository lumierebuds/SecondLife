package com.kh.secondLife.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardImg {
	
	private int boardImgNo;
	private int boardNo;
	private String changeName;
	private String imgPath;
	private String status;
	private Date createDate;
	private Date modifyDate;
	
}

