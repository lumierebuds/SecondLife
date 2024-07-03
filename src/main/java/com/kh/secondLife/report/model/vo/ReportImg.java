package com.kh.secondLife.report.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportImg {
	private int reportImgNo;
	private int reportNo;
	private String changeName;
	private String reportPath;
	private String status;
	private Date createDate;
	private Date modifyDate;
}


