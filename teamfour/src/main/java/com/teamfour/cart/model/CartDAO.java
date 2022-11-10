package com.teamfour.cart.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.userinfo.db.ConnectionPool2;

public class CartDAO {

	private ConnectionPool2 pool;

	public CartDAO() {
		pool=new ConnectionPool2();
	}
	
	/**
	 * 카트 저장
	 * @param carVo
	 * @return
	 * @throws SQLException
	 */
	public int insertCart(CartVO carVo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		System.out.println(carVo);
		
		try {
			con=pool.getConnection();
			
			String sql="insert into CART(CARTNO, PDCODE, QTY, USER_NO)"
				+ " values(cart_seq.nextval,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, carVo.getPdcode());
			ps.setInt(2, carVo.getQty());
			ps.setInt(3, carVo.getUserNo());
			
			int cnt=ps.executeUpdate();
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	/**
	 * 장바구니 조회
	 * @return
	 * @throws SQLException
	 */
	public List<CartVO> selectCartItem(int userno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<CartVO> list = new ArrayList<>();
		CartVO vo = null;
		try {
			con = pool.getConnection();
			
			String sql = "select c.*, c.qty*p.price as totalprice from \r\n"
					+ "cart c join productList p\r\n"
					+ "on c.pdcode=p.pdcode\r\n"
					+ "join userinfo u\r\n"
					+ "on c.user_no=u.user_no\r\n"
					+ "where u.user_no=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, userno);
			
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int cartno = rs.getInt("cartno");
				int pdcode = rs.getInt("pdcode");
				int qty = rs.getInt("qty");
				int totalprice = rs.getInt("totalprice");
				
				vo = new CartVO(cartno, pdcode, qty, userno, totalprice);
				list.add(vo);
			}
			System.out.println("selectCartItem / userno = "+userno);
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int deleteCart(int cartno) throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			
			String sql="delete from cart where cartno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, cartno);
			
			int cnt=ps.executeUpdate();
			System.out.println("상품 삭제결과 cnt="+cnt+", 매개변수 cartno"+cartno);
			return cnt;
			
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<CartVO> selectMainCartItem(String userid) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<CartVO> list = new ArrayList<>();
		CartVO vo = null;
		try {
			con = pool.getConnection();
			
			String sql = "SELECT A.PDCODE AS pdcode , A.CARTNO AS cartNo , A.QTY AS qty \r\n"
					+ ", A.USER_NO AS userNo , B.PRICE AS price , B.PDNAME AS pdname\r\n"
					+ ", B.IMAGE AS image, B.price * A.qty AS totalprice\r\n"
					+ "FROM CART A INNER JOIN PRODUCTLIST B \r\n"
					+ "ON A.PDCODE = B.PDCODE \r\n"
					+ "join userinfo u \r\n"
					+ "on u.user_no = A.user_no\r\n"
					+ "where u.user_id = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int pdcode = rs.getInt("pdcode");
				int cartno = rs.getInt("cartno");
				int qty = rs.getInt("qty");
				int userno = rs.getInt("userno");
				int price = rs.getInt("price");
				String pdname = rs.getString("pdname");
				String image = rs.getString("image");
				int totalprice = rs.getInt("totalprice");
				
				vo = new CartVO();
				
				list.add(vo);
			}
			System.out.println("selectMainCartItem / userid = "+userid);
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
}
