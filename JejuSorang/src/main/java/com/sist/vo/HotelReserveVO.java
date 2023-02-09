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
	private int hrno,hprice,hno;
	private String hreno,id,hpycheck,ckin,ckout,rno;
	private HotelVO hvo;
	private RoomVO rvo;
	private MemberVO mvo;
	
	public RoomVO getRvo() {
		return rvo;
	}
	public void setRvo(RoomVO rvo) {
		this.rvo = rvo;
	}
	public String getRno() {
		return rno;
	}
	public void setRno(String rno) {
		this.rno = rno;
	}
	public HotelVO getHvo() {
		return hvo;
	}
	public void setHvo(HotelVO hvo) {
		this.hvo = hvo;
	}
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}
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
	public String getCkin() {
		return ckin;
	}
	public void setCkin(String ckin) {
		this.ckin = ckin;
	}
	public String getCkout() {
		return ckout;
	}
	public void setCkout(String ckout) {
		this.ckout = ckout;
	}

	
}