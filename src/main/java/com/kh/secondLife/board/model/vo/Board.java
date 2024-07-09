package com.kh.secondLife.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	
	private int boardNo;
	private int categoryNo;
	private int boardWriter;
	private int tradeCategoryNo;
	private String productName; 
	private int price;
	private int condition; 
	private String content;
	private Date createDate;
	private Date modifyDate;
	private String status;
	private String saleCondition;
	
}










