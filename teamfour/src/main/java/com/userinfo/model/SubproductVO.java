package com.userinfo.model;

public class SubproductVO {
 
	private int div_no; // NUMBER NOT NULL, /* 소분류코드 */
	private String subproduct_name; //VARCHAR2(50) NOT NULL, /* 제품명 */
	private int maincode; // NUMBER NOT NULL /* 대분류코드 */
	
	public SubproductVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SubproductVO(int div_no, String subproduct_name, int maincode) {
		super();
		this.div_no = div_no;
		this.subproduct_name = subproduct_name;
		this.maincode = maincode;
	}

	public int getDiv_no() {
		return div_no;
	}

	public void setDiv_no(int div_no) {
		this.div_no = div_no;
	}

	public String getSubproduct_name() {
		return subproduct_name;
	}

	public void setSubproduct_name(String subproduct_name) {
		this.subproduct_name = subproduct_name;
	}

	public int getMaincode() {
		return maincode;
	}

	public void setMaincode(int maincode) {
		this.maincode = maincode;
	}

	@Override
	public String toString() {
		return "SubproductVO [div_no=" + div_no + ", subproduct_name=" + subproduct_name + ", maincode=" + maincode
				+ "]";
	}
	
}
