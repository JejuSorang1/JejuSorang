package com.sist.vo;

public class RcomVO {
 private int rcno,all_cate_no,jjim_count;
 private double star;
 private String rname,rctel,rcaddr;
 
public int getRcno() {
	return rcno;
}
public int getAll_cate_no() {
	return all_cate_no;
}
public void setAll_cate_no(int all_cate_no) {
	this.all_cate_no = all_cate_no;
}
public void setRcno(int rcno) {
	this.rcno = rcno;
}
public double getStar() {
	return star;
}
public void setStar(double star) {
	this.star = star;
}
public String getRname() {
	return rname;
}
public void setRname(String rname) {
	this.rname = rname;
}
public String getRctel() {
	return rctel;
}
public void setRctel(String rctel) {
	this.rctel = rctel;
}
public String getRcaddr() {
	return rcaddr;
}
public void setRcaddr(String rcaddr) {
	this.rcaddr = rcaddr;
}
 
}
