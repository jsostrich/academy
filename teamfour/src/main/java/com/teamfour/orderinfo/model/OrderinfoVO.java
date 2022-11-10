package com.teamfour.orderinfo.model;

import java.sql.Timestamp;

public class OrderinfoVO {
	private int order_no;  /* 주문번호 */
	private int user_no;  /* 회원번호 */
	private int pdcode; /* 상품코드 */
	private Timestamp orderdate; /* 주문일 */
	private int qty; /* 상품개수 */
	private int totalprice; /* 총금액 */
	private String del_name;/* 배송받는사람이름 */
	private String del_tel; /* 배송받는연락처 */
	private String del_add;  /* 배송받는주소 */
	private String del_deadd;  /* 배송받는상세주소 */
	private String del_email;  /* 배송받는이메일 */
	private int refund_mgno; /* 환불번호 */
	
	public OrderinfoVO() {
		super();
	}

	public OrderinfoVO(int order_no, int user_no, int pdcode, Timestamp orderdate, int qty, int totalprice,
			String del_name, String del_tel, String del_add, String del_deadd, String del_email, int refund_mgno) {
		super();
		this.order_no = order_no;
		this.user_no = user_no;
		this.pdcode = pdcode;
		this.orderdate = orderdate;
		this.qty = qty;
		this.totalprice = totalprice;
		this.del_name = del_name;
		this.del_tel = del_tel;
		this.del_add = del_add;
		this.del_deadd = del_deadd;
		this.del_email = del_email;
		this.refund_mgno = refund_mgno;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
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

	public Timestamp getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(Timestamp orderdate) {
		this.orderdate = orderdate;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}

	public String getDel_name() {
		return del_name;
	}

	public void setDel_name(String del_name) {
		this.del_name = del_name;
	}

	public String getDel_tel() {
		return del_tel;
	}

	public void setDel_tel(String del_tel) {
		this.del_tel = del_tel;
	}

	public String getDel_add() {
		return del_add;
	}

	public void setDel_add(String del_add) {
		this.del_add = del_add;
	}

	public String getDel_deadd() {
		return del_deadd;
	}

	public void setDel_deadd(String del_deadd) {
		this.del_deadd = del_deadd;
	}

	public String getDel_email() {
		return del_email;
	}

	public void setDel_email(String del_email) {
		this.del_email = del_email;
	}

	public int getRefund_mgno() {
		return refund_mgno;
	}

	public void setRefund_mgno(int refund_mgno) {
		this.refund_mgno = refund_mgno;
	}

	@Override
	public String toString() {
		return "OrderinfoVO [order_no=" + order_no + ", user_no=" + user_no + ", pdcode=" + pdcode + ", orderdate="
				+ orderdate + ", qty=" + qty + ", totalprice=" + totalprice + ", del_name=" + del_name + ", del_tel="
				+ del_tel + ", del_add=" + del_add + ", del_deadd=" + del_deadd + ", del_email=" + del_email
				+ ", refund_mgno=" + refund_mgno + "]";
	}
	
	
	
	
}
