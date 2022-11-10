package com.sellerinfo.model;

import java.sql.Timestamp;

public class SellerInfoVO {
	private long seller_no; //NUMBER NOT NULL, /* 판매자번호 */
	private String seller_name; // VARCHAR2(20) NOT NULL, /* 판매자명 */
	private String seller_nick; // VARCHAR2(30) NOT NULL, /* 닉네임 */
	private String seller_id; // VARCHAR2(30) NOT NULL, /* 판매자아이디 */
	private String seller_pwd; //VARCHAR2(30) NOT NULL, /* 판배자비밀번호 */
	private String seller_tel; //VARCHAR2(30) NOT NULL, /* 판매자연락처 */
	private String seller_email; //VARCHAR2(50) NOT NULL, /* 판매자이메일 */
	private String seller_zipcode; //VARCHAR2(60) not null, /* 우편번호 */
	private String seller_address; //VARCHAR2(80) NOT NULL, /* 판매자주소 */
	private Timestamp seller_joindate; //DATE DEFAULT sysdate, /* 가입날짜 */
	private int seller_class; //number default 2
	private String outdate;
	
	public SellerInfoVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SellerInfoVO(long seller_no, String seller_name, String seller_nick, String seller_id, String seller_pwd,
			String seller_tel, String seller_email, String seller_zipcode, String seller_address,
			Timestamp seller_joindate, int seller_class) {
		super();
		this.seller_no = seller_no;
		this.seller_name = seller_name;
		this.seller_nick = seller_nick;
		this.seller_id = seller_id;
		this.seller_pwd = seller_pwd;
		this.seller_tel = seller_tel;
		this.seller_email = seller_email;
		this.seller_zipcode = seller_zipcode;
		this.seller_address = seller_address;
		this.seller_joindate = seller_joindate;
		this.seller_class = seller_class;
	}


	public long getSeller_no() {
		return seller_no;
	}

	public void setSeller_no(long seller_no) {
		this.seller_no = seller_no;
	}

	public String getSeller_name() {
		return seller_name;
	}

	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}

	public String getSeller_nick() {
		return seller_nick;
	}

	public void setSeller_nick(String seller_nick) {
		this.seller_nick = seller_nick;
	}

	public String getSeller_id() {
		return seller_id;
	}

	public void setSeller_id(String seller_id) {
		this.seller_id = seller_id;
	}

	public String getSeller_pwd() {
		return seller_pwd;
	}

	public void setSeller_pwd(String seller_pwd) {
		this.seller_pwd = seller_pwd;
	}

	public String getSeller_tel() {
		return seller_tel;
	}

	public void setSeller_tel(String seller_tel) {
		this.seller_tel = seller_tel;
	}

	public String getSeller_email() {
		return seller_email;
	}

	public void setSeller_email(String seller_email) {
		this.seller_email = seller_email;
	}

	public String getSeller_zipcode() {
		return seller_zipcode;
	}

	public void setSeller_zipcode(String seller_zipcode) {
		this.seller_zipcode = seller_zipcode;
	}

	public String getSeller_address() {
		return seller_address;
	}

	public void setSeller_address(String seller_address) {
		this.seller_address = seller_address;
	}

	public Timestamp getSeller_joindate() {
		return seller_joindate;
	}

	public void setSeller_joindate(Timestamp seller_joindate) {
		this.seller_joindate = seller_joindate;
	}

	public int getSeller_class() {
		return seller_class;
	}

	public void setSeller_class(int seller_class) {
		this.seller_class = seller_class;
	}
	

	public String getOutdate() {
		return outdate;
	}

	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}

	@Override
	public String toString() {
		return "SellorInfoVO [seller_no=" + seller_no + ", seller_name=" + seller_name + ", seller_nick=" + seller_nick
				+ ", seller_id=" + seller_id + ", seller_pwd=" + seller_pwd + ", seller_tel=" + seller_tel
				+ ", seller_email=" + seller_email + ", seller_zipcode=" + seller_zipcode + ", seller_address="
				+ seller_address + ", seller_joindate=" + seller_joindate + ", seller_class=" + seller_class + "]";
	}
	
	
}
