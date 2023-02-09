package com.sist.vo;

import java.sql.Date;

public class RentReserveVO {
private int rrno,rprice,car_no;
private String id,start_rent,end_rent;
private char rpycheck;

public String getStart_rent() {
	return start_rent;
}
public void setStart_rent(String start_rent) {
	this.start_rent = start_rent;
}
public String getEnd_rent() {
	return end_rent;
}
public void setEnd_rent(String end_rent) {
	this.end_rent = end_rent;
}
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


public int getCar_no() {
	return car_no;
}
public void setCar_no(int car_no) {
	this.car_no = car_no;
}
public char getRpycheck() {
	return rpycheck;
}
public void setRpycheck(char rpycheck) {
	this.rpycheck = rpycheck;
}

}