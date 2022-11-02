package com.herbmall.comment;

import java.sql.Timestamp;

public class CommentVO {
	private int no;
	private String name;//             varchar2(20)    not null,                
	private String pwd;   //           varchar2(20)    not null,            
	private Timestamp regdate; //         date        default  sysdate,    
	private String content; //         varchar2(2000)         null,          
	private int bdNo; //	
	
	public CommentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentVO(int no, String name, String pwd, Timestamp regdate, String content, int bdNo) {
		super();
		this.no = no;
		this.name = name;
		this.pwd = pwd;
		this.regdate = regdate;
		this.content = content;
		this.bdNo = bdNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getBdNo() {
		return bdNo;
	}

	public void setBdNo(int bdNo) {
		this.bdNo = bdNo;
	}

	@Override
	public String toString() {
		return "CommentVO [no=" + no + ", name=" + name + ", pwd=" + pwd + ", regdate=" + regdate + ", content="
				+ content + ", bdNo=" + bdNo + "]";
	}
	
	
	
	
}
