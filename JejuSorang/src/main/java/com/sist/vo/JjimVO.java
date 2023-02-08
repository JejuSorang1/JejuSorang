package com.sist.vo;
/* 
 * 	ALL_CATE_NO          NUMBER      
	JNO        NOT NULL NUMBER      
	NO                  NUMBER      
	ID                  VARCHAR2(20)                 VARCHAR2(20) 
 */
public class JjimVO {

	private int all_cate_no,jno,no,hno,car_no;
	private String id,hotel_image,name,car_name,car_image;
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
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public int getCar_no() {
		return car_no;
	}
	public void setCar_no(int car_no) {
		this.car_no = car_no;
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
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public String getCar_image() {
		return car_image;
	}
	public void setCar_image(String car_image) {
		this.car_image = car_image;
	}

	

}
