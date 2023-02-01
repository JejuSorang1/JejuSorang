package com.sist.vo;

import java.sql.Date;

public class RentReviewVO {
private int rcno,rent_review_no;
private String id,msg;
private Date regdate;
public int getRcno() {
	return rcno;
}
public void setRcno(int rcno) {
	this.rcno = rcno;
}
public int getRent_review_no() {
	return rent_review_no;
}
public void setRent_review_no(int rent_review_no) {
	this.rent_review_no = rent_review_no;
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
