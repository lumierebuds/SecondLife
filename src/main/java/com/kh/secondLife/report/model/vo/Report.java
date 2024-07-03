package com.kh.secondLife.report.model.vo;

import java.sql.Date;

import com.kh.secondLife.board.model.vo.BoardImg;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Report {
	private int reportNo;
	private int targetNo;
	private int targetMemberNo;
	private int writerNo;
	private String content;
	private Date createDate;
	private String status;
	
}

