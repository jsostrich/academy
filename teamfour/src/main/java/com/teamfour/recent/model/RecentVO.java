package com.teamfour.recent.model;

public class RecentVO {
	private int recent_no; /* 최근본상품번호 */
	private int user_no; /* 회원번호 */
	private int pdcode; /* 상품코드 */
	
	
	public RecentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RecentVO(int recent_no, int user_no, int pdcode) {
		super();
		this.recent_no = recent_no;
		this.user_no = user_no;
		this.pdcode = pdcode;
	}

	public int getRecent_no() {
		return recent_no;
	}

	public void setRecent_no(int recent_no) {
		this.recent_no = recent_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getPdcode() {
		return pdcode;
	}

	public void setPdcode(int pdcode) {
		this.pdcode = pdcode;
	}
	
	
}
