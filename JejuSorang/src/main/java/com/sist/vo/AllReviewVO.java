package com.sist.vo;
/*
	 ALL_REVIEW_NO NOT NULL NUMBER       
	 ID                     VARCHAR2(20) 
	 CATE_NO       NOT NULL NUMBER       
	 DETAIL_NO     NOT NULL NUMBER       
	 MSG           NOT NULL CLOB         
	 REGDATE       NOT NULL DATE         
	 STAR                   NUMBER  
 */
import java.util.*;
public class AllReviewVO {
	private int all_review_no,cate_no,detail_no,star;
	private String id,msg,dbday;
	private Date regdate;
	private HotelVO hvo;
	private CarVO cvo;
	
	
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public int getAll_review_no() {
		return all_review_no;
	}
	public void setAll_review_no(int all_review_no) {
		this.all_review_no = all_review_no;
	}
	public int getCate_no() {
		return cate_no;
	}
	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}
	public int getDetail_no() {
		return detail_no;
	}
	public void setDetail_no(int detail_no) {
		this.detail_no = detail_no;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
