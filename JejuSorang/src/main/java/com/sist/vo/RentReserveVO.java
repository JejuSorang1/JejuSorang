package com.sist.vo;


public class RentReserveVO {
private int rrno,rprice,car_no;
private String id,start_rent,end_rent,rpycheck;;
private CarVO cv;

public CarVO getCv() {
	return cv;
}
public void setCv(CarVO cv) {
	this.cv = cv;
}
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
public String getRpycheck() {
	return rpycheck;
}
public void setRpycheck(String rpycheck) {
	this.rpycheck = rpycheck;
}


}