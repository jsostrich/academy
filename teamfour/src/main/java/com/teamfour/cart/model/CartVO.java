package com.teamfour.cart.model;

public class CartVO {
	private int cartNo;
	private int userNo;
	private int pdcode;
	private String image;
	private String pdName;
	private int price;
	private int qty;
	private int totalprice;
	
	
	public CartVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public CartVO(int cartNo, int userNo, int pdcode, int qty) {
		super();
		this.cartNo = cartNo;
		this.userNo = userNo;
		this.pdcode = pdcode;
		this.qty = qty;
	}


	public CartVO(int cartNo, int userNo, int pdcode, String image, String pdName, int price, int qty, int totalprice) {
		super();
		this.cartNo = cartNo;
		this.userNo = userNo;
		this.pdcode = pdcode;
		this.image = image;
		this.pdName = pdName;
		this.price = price;
		this.qty = qty;
		this.totalprice = totalprice;
	}

	
	public CartVO(int cartNo, int pdcode, int qty, int userNo, int totalprice) {
		super();
		this.cartNo = cartNo;
		this.pdcode = pdcode;
		this.qty = qty;
		this.userNo = userNo;
		this.totalprice = totalprice;
	}


	public int getPdcode() {
		return pdcode;
	}
	public void setPdcode(int pdcode) {
		this.pdcode = pdcode;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "CartVO [pdcode=" + pdcode + ", image=" + image + ", pdName=" + pdName + ", price=" + price + ", qty="
				+ qty + ", totalprice=" + totalprice + "]";
	}
	
	
	
}
