package com.sist.vo;

import java.util.Date;
/*
 * HRNO    NOT NULL NUMBER      
CKIN    NOT NULL DATE        
CKOUT   NOT NULL DATE        
HRENO   NOT NULL VARCHAR2(20) 
HPRICE  NOT NULL NUMBER      
HPYCHECK          CHAR(1)     
ID               VARCHAR2(20) 
HNO              NUMBER 
RNO				NUMBER
 */ 
public class HotelReserveVO {
	private int hrno,hprice,hno,rno;
	private String hreno,id,hpycheck;
	private Date ckin,ckout;
	public int getHrno() {
		return hrno;
	}
	public void setHrno(int hrno) {
		this.hrno = hrno;
	}
	public int getHprice() {
		return hprice;
	}
	public void setHprice(int hprice) {
		this.hprice = hprice;
	}
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getHreno() {
		return hreno;
	}
	public void setHreno(String hreno) {
		this.hreno = hreno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHpycheck() {
		return hpycheck;
	}
	public void setHpycheck(String hpycheck) {
		this.hpycheck = hpycheck;
	}
	public Date getCkin() {
		return ckin;
	}
	public void setCkin(Date ckin) {
		this.ckin = ckin;
	}
	public Date getCkout() {
		return ckout;
	}
	public void setCkout(Date ckout) {
		this.ckout = ckout;
	}
	
	
	
	
}