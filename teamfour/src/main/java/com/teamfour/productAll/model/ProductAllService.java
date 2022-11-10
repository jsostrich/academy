package com.teamfour.productAll.model;

import java.sql.SQLException;
import java.util.List;

public class ProductAllService {
	private ProductAllDAO dao;
	
	public ProductAllService() {
		dao = new ProductAllDAO();
	}
	
	public List<ProductAllVO> selectByName(String name) throws SQLException{
		return dao.selectByName(name);
	}
	
	public ProductAllVO selectByPdCode(int pdcode) throws SQLException{
		return dao.selectByPdCode(pdcode);
	}
	
	public List<ProductAllVO> selectByMaincode(int maincode) throws SQLException{
		return dao.selectByMaincode(maincode);
	}
	
	public List<ProductAllVO> filterByPrice(List<ProductAllVO> list, int minPrice, int maxPrice) {
		return dao.filterByPrice(list, minPrice, maxPrice);
	}
	
	public int insertProductAll(ProductAllVO vo) throws SQLException {
		return dao.insertProductAll(vo);
	}
	
	public int deleteProductAll(int pdcode) throws SQLException {
		return dao.deleteProductAll(pdcode);
	}
	
	public List<ProductAllVO> selectbySellerNo(String seller_id) throws SQLException{
		return dao.selectbySellerNo(seller_id);
	}
	
	public ProductAllVO detailProduct(int pdcode) throws SQLException {
		return dao.detailProduct(pdcode);
	}

}
