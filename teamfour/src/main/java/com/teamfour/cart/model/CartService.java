package com.teamfour.cart.model;

import java.sql.SQLException;
import java.util.List;

public class CartService {

	private CartDAO dao;

	public CartService() {
		dao = new CartDAO();
	}

	public int insertCart(CartVO vo) throws SQLException {
		return dao.insertCart(vo);
	}

	public List<CartVO> selectCartItem(int userno) throws SQLException {
		return dao.selectCartItem(userno);
	}
	
	public int deleteCart(int cartno) throws SQLException {
		return dao.deleteCart(cartno);
	}
	
	public List<CartVO> selectMainCartItem(String userid) throws SQLException{
		return dao.selectMainCartItem(userid);
	}

}


