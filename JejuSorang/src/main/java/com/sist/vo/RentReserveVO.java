package com.sist.vo;

import java.sql.Date;

public class RentReserveVO {
private int rrno,rprice;
private String id, rreno;
private Date start_rent,end_rent;
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
public Date getStart_rent() {
	return start_rent;
}
public void setStart_rent(Date start_rent) {
	this.start_rent = start_rent;
}
public Date getEnd_rent() {
	return end_rent;
}
public void setEnd_rent(Date end_rent) {
	this.end_rent = end_rent;
}
public char getRpycheck() {
	return rpycheck;
}
public void setRpycheck(char rpycheck) {
	this.rpycheck = rpycheck;
}

}