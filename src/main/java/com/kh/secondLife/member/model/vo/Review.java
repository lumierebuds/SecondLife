package com.kh.secondLife.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private int reviewNo;
	private int boardNo;
	private int reviewMemberNo;
	private String content;
	private Date createDate;
	private Date modifyDate;
	private String status;
}
