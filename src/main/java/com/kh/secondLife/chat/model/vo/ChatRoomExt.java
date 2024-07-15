package com.kh.secondLife.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatRoomExt extends ChatRoom {
	private String productName;
	private String nickname;
}
