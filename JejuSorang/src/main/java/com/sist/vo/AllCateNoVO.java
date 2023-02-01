package com.sist.vo;
/*
 * ALL_CATE_NO NOT NULL NUMBER       
CATE_NAME   NOT NULL VARCHAR2(30) 
 */
public class AllCateNoVO {
	private int all_cate_no;
	private String cate_name;
	public int getAll_cate_no() {
		return all_cate_no;
	}
	public void setAll_cate_no(int all_cate_no) {
		this.all_cate_no = all_cate_no;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	
	
}
