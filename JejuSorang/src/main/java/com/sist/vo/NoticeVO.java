package com.sist.vo;
/*
 * NO      NOT NULL NUMBER         
	TYPE             NUMBER         
	NAME    NOT NULL VARCHAR2(34)   
	SUBJECT NOT NULL VARCHAR2(1000) 
	CONTENT NOT NULL CLOB           
	REGDATE          DATE           
	HIT              NUMBER         

 */

import java.util.Date;

public class NoticeVO {
  private int no,hit;
  private String type,name,subject,content,db_day;
  private Date regdate;
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public int getHit() {
	return hit;
}
public void setHit(int hit) {
	this.hit = hit;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getDb_day() {
	return db_day;
}
public void setDb_day(String db_day) {
	this.db_day = db_day;
}
public Date getRegdate() {
	return regdate;
}
public void setRegdate(Date regdate) {
	this.regdate = regdate;
}
  
  
}
