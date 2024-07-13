package com.kh.secondLife.member.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
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
