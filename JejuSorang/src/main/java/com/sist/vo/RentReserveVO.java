package com.sist.vo;

import java.sql.Date;

public class RentReserveVO {
private int rrno,rprice;
private String id, rreno;
private Date start_date,end_date;
private char rpycheck;
public int getRrno() {
	return rrno;
}
public void setRrno(int rrno) {
	this.rrno = rrno;
}
public int getRprice() {
	return rprice;
}
public void setRprice(int rprice) {
	this.rprice = rprice;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getRreno() {
	return rreno;
}
public void setRreno(String rreno) {
	this.rreno = rreno;
}
public Date getStart_date() {
	return start_date;
}
public void setStart_date(Date start_date) {
	this.start_date = start_date;
}
public Date getEnd_date() {
	return end_date;
}
public void setEnd_date(Date end_date) {
	this.end_date = end_date;
}
public char getRpycheck() {
	return rpycheck;
}
public void setRpycheck(char rpycheck) {
	this.rpycheck = rpycheck;
}


}
