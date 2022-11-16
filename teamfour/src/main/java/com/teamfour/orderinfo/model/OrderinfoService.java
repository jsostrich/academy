package com.teamfour.orderinfo.model;

import java.sql.SQLException;
import java.util.List;

import com.teamfour.productAll.model.ProductAllVO;

public class OrderinfoService {
	private OrderinfoDAO dao;
	public OrderinfoService() {
		dao = new OrderinfoDAO();
	}
	
	public int insertOrderinfo(OrderinfoVO vo) throws SQLException {
		return dao.insertOrderinfo(vo);
	}
	
	public ProductAllVO detailViewPdCode(int pdcode) throws SQLException{
		return dao.detailViewPdCode(pdcode);
	}
	public List<ProductAllVO> selectByMaincode(int maincode) throws SQLException{
		return dao.selectByMaincode(maincode);
	}
	
	public List<ProductAllVO> selectAllPd() throws SQLException{
		return dao.selectAllPd();
	}
	
	public List<OrderinfoVO> userOrder(String userid) throws SQLException{
		return dao.userOrder(userid);
	}
	
	public boolean buyOrder(int cartNo, int userNo, int pdCode, int qty, String userName,
			String userTel, String userZipcode, String userAddress, String userEmail) 
					throws SQLException {
		return dao.buyOrder(cartNo, userNo, pdCode, qty, userName, userTel, userZipcode, 
				userAddress, userEmail);
	}	
}
