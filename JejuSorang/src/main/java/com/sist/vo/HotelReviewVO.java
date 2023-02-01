package com.sist.vo;
/*
 * H_REVIEW_NO NOT NULL NUMBER       
	MSG                  CLOB         
	REGDATE              DATE         
	STAR                 NUMBER(2,1)  
	ID                   VARCHAR2(20) 
	HNO                  NUMBER    
 */

import java.util.Date;

public class HotelReviewVO {
	private int h_review_no,hno;
	private String msg,id,dbday;
	private double star;
	private Date regdate;
	public int getH_review_no() {
		return h_review_no;
	}
	public void setH_review_no(int h_review_no) {
		this.h_review_no = h_review_no;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
