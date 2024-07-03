package com.kh.secondLife.chat.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatMessage {
	private int chatMessageNo;
	private int chatRoomNo;
	private String message;
	private int memberNo;
	private Date createDate;
	private String status;
}
