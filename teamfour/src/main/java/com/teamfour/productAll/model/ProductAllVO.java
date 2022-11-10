package com.teamfour.productAll.model;

import java.sql.Timestamp;

public class ProductAllVO {
	private int pdcode; /* 상품코드 */
	private String pdname; /* 상품명 */
	private int price; /* 가격 */
	private int qty; //not null check(qty>=0) /* 재고 */
	private Timestamp regdate; /* 등록일 */
	private long seller_no; /* 판매자번호 */
	private String image; /* 이미지 */
	private String detail; /* 상세설명 */
	private int div_no; /* 소분류코드 */
	
	private String subproduct_name; /* 제품명 */
	
	private int maincode; /* 대분류코드 */
	private String mainname; /* 대분류이름 */
	
	
	public ProductAllVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ProductAllVO(int pdcode, String pdname, int price, Timestamp regdate, long seller_no, String image,
			String detail, int div_no, String subproduct_name, int maincode, String mainname) {
		super();
		this.pdcode = pdcode;
		this.pdname = pdname;
		this.price = price;
		this.regdate = regdate;
		this.seller_no = seller_no;
		this.image = image;
		this.detail = detail;
		this.div_no = div_no;
		this.subproduct_name = subproduct_name;
		this.maincode = maincode;
		this.mainname = mainname;
	}
	
	

	public ProductAllVO(int pdcode, String pdname, int price, int qty,Timestamp regdate, long seller_no, String image,
			String detail, int div_no) {
		super();
		this.pdcode = pdcode;
		this.pdname = pdname;
		this.price = price;
		this.qty = qty;
		this.regdate = regdate;
		this.seller_no = seller_no;
		this.image = image;
		this.detail = detail;
		this.div_no = div_no;
	}
	
	public ProductAllVO(int pdcode, String pdname, int price, Timestamp regdate, long seller_no, String image,
			String detail, int div_no) {
		super();
		this.pdcode = pdcode;
		this.pdname = pdname;
		this.price = price;
		this.regdate = regdate;
		this.seller_no = seller_no;
		this.image = image;
		this.detail = detail;
		this.div_no = div_no;
	}
	
	public ProductAllVO(int pdcode, String pdname, int price, int qty, Timestamp regdate, long seller_no, String image,
			String detail, int div_no, String subproduct_name, int maincode, String mainname) {
		super();
		this.pdcode = pdcode;
		this.pdname = pdname;
		this.price = price;
		this.qty = qty;
		this.regdate = regdate;
		this.seller_no = seller_no;
		this.image = image;
		this.detail = detail;
		this.div_no = div_no;
		this.subproduct_name = subproduct_name;
		this.maincode = maincode;
		this.mainname = mainname;
	}


	public int getPdcode() {
		return pdcode;
	}

	public void setPdcode(int pdcode) {
		this.pdcode = pdcode;
	}

	public String getPdname() {
		return pdname;
	}

	public void setPdname(String pdname) {
		this.pdname = pdname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public long getSeller_no() {
		return seller_no;
	}
	
	public void setSeller_no(long seller_no) {
		this.seller_no = seller_no;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
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

	public String getMainname() {
		return mainname;
	}

	public void setMainname(String mainname) {
		this.mainname = mainname;
	}

	public int getQty() {
		return qty;
	}


	public void setQty(int qty) {
		this.qty = qty;
	}


	@Override
	public String toString() {
		return "ProductAllVO [pdcode=" + pdcode + ", pdname=" + pdname + ", price=" + price + ", qty=" + qty
				+ ", regdate=" + regdate + ", seller_no=" + seller_no + ", image=" + image + ", detail=" + detail
				+ ", div_no=" + div_no + ", subproduct_name=" + subproduct_name + ", maincode=" + maincode
				+ ", mainname=" + mainname + "]";
	}
	
	
	
}
