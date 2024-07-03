package com.kh.secondLife.chat.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatRoom {
	private int chatRoomNo;
	private int boardNo;
	private int secondMemberNo;
	private int firstMemberNo;
	private Date createDate;
	private String status;
	private String notice;
}
