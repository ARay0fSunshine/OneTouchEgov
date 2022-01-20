package com.onetouch.web.mtr.ord.dao;

import lombok.Data;

@Data
public class MtrOrdVO {
	private String ordNo;
	private String mtrCd;
	private String mtrNm;
	private String unit;
	private String unitCost;
	private String ordCnt;
	private String totCost;
	private String ordAmt;
	private String inAmt;
	private String notinAmt;
	private String ordDate;
	private String compNm;
	private String cmt;
	private String mngAmt;
}
