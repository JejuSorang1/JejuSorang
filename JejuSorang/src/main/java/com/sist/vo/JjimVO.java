package com.sist.vo;
/* 
 * 	ALL_CATE_NO          NUMBER      
	JNO        NOT NULL NUMBER      
	NO                  NUMBER      
	ID                  VARCHAR2(20)                 VARCHAR2(20) 
 */
public class JjimVO {
	private int all_cate_no,jno,no;
	private String id,hotel_image,name,addr,rname,rctel,rcaddr;
	
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
	public int getAll_cate_no() {
		return all_cate_no;
	}
	public void setAll_cate_no(int all_cate_no) {
		this.all_cate_no = all_cate_no;
	}
	public int getJno() {
		return jno;
	}
	public void setJno(int jno) {
		this.jno = jno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHotel_image() {
		return hotel_image;
	}
	public void setHotel_image(String hotel_image) {
		this.hotel_image = hotel_image;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	

}
