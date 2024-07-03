package com.kh.secondLife.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	private int memberNo;
	private String id;
	private String pwd;
	private String nickname;
	private String name;
	private String address;
	private String phone;
	private String email;
	private String status;
	private Date createDate;
	private Date modifyDate;
	private int reportCount;
	private String adminAuth;
 	
}

