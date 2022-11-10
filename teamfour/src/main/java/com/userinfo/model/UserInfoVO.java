package com.userinfo.model;

import java.sql.Timestamp;

public class UserInfoVO {
	private int user_no; //NUMBER NOT NULL, /* 회원번호 */
	private String user_name; //VARCHAR2(20) not null, /* 회원명 */
	private String user_nick; //VARCHAR2(30) not null unique, /* 닉네임 */
	private String user_id; //VARCHAR2(30) not null unique, /* 아이디 */
	private String user_pwd; //VARCHAR2(30) NOT NULL, /* 비밀번호 */
	private String user_tel; //VARCHAR2(30) NOT NULL unique, /* 연락처 */
	private String user_email; //VARCHAR2(50) NOT NULL unique, /* 이메일 */
	private String user_zipcode; //
	private String user_address; //VARCHAR2(80) NOT NULL, /* 주소 */
	private Timestamp user_joindate; //DEFAULT sysdate, /* 가입날짜 */
	private int user_class; // number default 1, 회원 분류코드 1번 구매자
    private String outdate;// varchar2(10) 아웃데이트 회원 탈퇴여부
	
	public UserInfoVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	 

	public UserInfoVO(int user_no, String user_name, String user_nick, String user_id, String user_pwd, String user_tel,
			String user_email, String user_address, String user_zipcode, Timestamp user_joindate) {
		super();
		this.user_no = user_no;
		this.user_name = user_name;
		this.user_nick = user_nick;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_tel = user_tel;
		this.user_email = user_email;
		this.user_address = user_address;
		this.user_zipcode = user_zipcode;
		this.user_joindate = user_joindate;
	}
	
	public UserInfoVO(int user_no, String user_name, String user_nick, String user_id, String user_pwd, String user_tel,
			String user_email, String user_zipcode, String user_address, Timestamp user_joindate, int user_class,
			String outdate) {
		super();
		this.user_no = user_no;
		this.user_name = user_name;
		this.user_nick = user_nick;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_tel = user_tel;
		this.user_email = user_email;
		this.user_zipcode = user_zipcode;
		this.user_address = user_address;
		this.user_joindate = user_joindate;
		this.user_class = user_class;
		this.outdate = outdate;
	}


	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public Timestamp getUser_joindate() {
		return user_joindate;
	}

	public void setUser_joindate(Timestamp user_joindate) {
		this.user_joindate = user_joindate;
	}


	public String getUser_zipcode() {
		return user_zipcode;
	}


	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}

	public int getUser_class() {
		return user_class;
	}


	public void setUser_class(int user_class) {
		this.user_class = user_class;
	}


	public String getOutdate() {
		return outdate;
	}


	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}


	@Override
	public String toString() {
		return "UserInfoVO [user_no=" + user_no + ", user_name=" + user_name + ", user_nick=" + user_nick + ", user_id="
				+ user_id + ", user_pwd=" + user_pwd + ", user_tel=" + user_tel + ", user_email=" + user_email
				+ ", user_address=" + user_address + ", user_zipcode=" + user_zipcode + ", user_joindate="
				+ user_joindate + "]";
	}

}
