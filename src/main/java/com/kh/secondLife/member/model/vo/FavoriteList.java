package com.kh.secondLife.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FavoriteList {
	private int memberNo;
	private int boardNo;
	private String status;
	private Date createDate;
}
