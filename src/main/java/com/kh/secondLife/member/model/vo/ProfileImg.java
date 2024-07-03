package com.kh.secondLife.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProfileImg {
	private int profileNo;
	private int memberNo;
	private String changeName;
	private String profilePath;
	private String status;
	private Date createDate;
	private Date modifyDate;

}
