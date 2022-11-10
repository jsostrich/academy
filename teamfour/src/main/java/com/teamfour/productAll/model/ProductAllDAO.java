package com.teamfour.productAll.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.userinfo.db.ConnectionPool2;

public class ProductAllDAO {
	private ConnectionPool2 pool;

	public ProductAllDAO() {
		pool=new ConnectionPool2();
	}
	
	public List<ProductAllVO> selectByName(String name) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ProductAllVO> list = new ArrayList<>();
		
		try {
			con = pool.getConnection();
			
			String sql = "select pl.*, s.subproduct_name, m.*"
					+ " from productList pl join subproduct s"
					+ " on pl.div_no = s.div_no"
					+ "	join mainproduct m"
					+ " on s.maincode = m.maincode"
					+ "	where pl.pdname like '%' || ? || '%'"
					+ " or s.subproduct_name like '%' || ? || '%'";
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, name);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int pdcode = rs.getInt("pdcode");
				String pdname = rs.getString("pdname");
				int price = rs.getInt("price");
				int qty = rs.getInt("qty");
				Timestamp regdate = rs.getTimestamp("regdate");
				int seller_no = rs.getInt("seller_no");
				String image = rs.getString("image");
				String detail = rs.getString("detail");
				int div_no = rs.getInt("div_no");
				String subproduct_name = rs.getString("subproduct_name");
				int maincode = rs.getInt("maincode");
				String mainname = rs.getString("mainname");
				
				ProductAllVO vo = new ProductAllVO(pdcode, pdname, price, qty, regdate, seller_no, image, detail, div_no, subproduct_name, maincode, mainname);
				list.add(vo);
			}
			System.out.println("이름으로 상품검색 결과 list.size=" + list.size()
				+", 매개변수 name=" + name);
			
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	public ProductAllVO selectByPdCode(int pdcode) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		ProductAllVO vo = new ProductAllVO();
		
		try {
			con = pool.getConnection();
			
			String sql = "select pl.*, s.subproduct_name, m.*"
					+ " from productList pl join subproduct s"
					+ " on pl.div_no = s.div_no"
					+ "	join mainproduct m"
					+ " on s.maincode = m.maincode"
					+ "	where pl.pdcode = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, pdcode);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				String pdname = rs.getString("pdname");
				int price = rs.getInt("price");
				int qty = rs.getInt("qty");
				Timestamp regdate = rs.getTimestamp("regdate");
				int seller_no = rs.getInt("seller_no");
				String image = rs.getString("image");
				String detail = rs.getString("detail");
				int div_no = rs.getInt("div_no");
				String subproduct_name = rs.getString("subproduct_name");
				int maincode = rs.getInt("maincode");
				String mainname = rs.getString("mainname");
				
				vo.setPdcode(pdcode);
				vo.setPdname(pdname);
				vo.setPrice(price);
				vo.setQty(qty);
				vo.setRegdate(regdate);
				vo.setSeller_no(seller_no);
				vo.setImage(image);
				vo.setDetail(detail);
				vo.setDiv_no(div_no);
				vo.setSubproduct_name(subproduct_name);
				vo.setMaincode(maincode);
				vo.setMainname(mainname);
			}
			System.out.println("상품번호로 상품검색 결과 vo=" + vo
				+", 매개변수 pdcode=" + pdcode);
			
			return vo;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public List<ProductAllVO> selectByMaincode(int maincode) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ProductAllVO> list = new ArrayList<>();
		
		try {
			con = pool.getConnection();
			
			String sql = "select pl.*, s.subproduct_name, m.*"
					+ " from productList pl join subproduct s"
					+ " on pl.div_no = s.div_no"
					+ "	join mainproduct m"
					+ " on s.maincode = m.maincode"
					+ "	where m.maincode = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, maincode);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int pdcode = rs.getInt("pdcode");
				String pdname = rs.getString("pdname");
				int price = rs.getInt("price");
				int qty = rs.getInt("qty");
				Timestamp regdate = rs.getTimestamp("regdate");
				int seller_no = rs.getInt("seller_no");
				String image = rs.getString("image");
				String detail = rs.getString("detail");
				int div_no = rs.getInt("div_no");
				String subproduct_name = rs.getString("subproduct_name");
				String mainname = rs.getString("mainname");
				
				ProductAllVO vo = new ProductAllVO(pdcode, pdname, price, qty, regdate, seller_no, image, detail,
						div_no, subproduct_name, maincode, mainname);
				list.add(vo);
			}
			System.out.println("대분류코드로 상품검색 결과 list.size=" + list.size()
				+", 매개변수 maincode=" + maincode);
			
			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public List<ProductAllVO> filterByPrice(List<ProductAllVO> list, int minPrice, int maxPrice) {
		List<ProductAllVO> filteredList = new ArrayList<>();
		
		if(maxPrice == 0) {
			for(ProductAllVO vo : list) {
				if(vo.getPrice() >= minPrice) {
					filteredList.add(vo);
				}
			}
		} else {
			for(ProductAllVO vo : list) {
				if(vo.getPrice() >= minPrice && vo.getPrice() < maxPrice) {
					filteredList.add(vo);
				}
			}
		}
		
		return filteredList;
	}
	
	public int insertProductAll(ProductAllVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into productList(pdcode, pdname, price, qty, seller_no, image, detail, div_no) "
				+ " values(productList_seq.nextval,?,?,?,?,?,?,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getPdname());
			ps.setInt(2, vo.getPrice());
			ps.setInt(3, vo.getQty());
			ps.setLong(4, vo.getSeller_no());
			ps.setString(5, vo.getImage());
			ps.setString(6, vo.getDetail());
			ps.setInt(7, vo.getDiv_no());
			
			int cnt=ps.executeUpdate();
			System.out.println("상품 등록 결과 cnt="+cnt+", 매개변수 vo="+vo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int deleteProductAll(int pdcode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con = pool.getConnection();
			
			String sql="delete from productList"
					+ " where pdcode = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, pdcode);
			
			int cnt = ps.executeUpdate();
			
			System.out.println("상품 삭제 결과 cnt=" + cnt + ", 매개변수 pdcode=" + pdcode);
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<ProductAllVO> selectbySellerNo(String seller_id) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = pool.getConnection();
			List<ProductAllVO> list = new ArrayList<>();
			String sql = "select p.* from "
					+ " productlist p join sellerinfo s "
					+ " on p.seller_no = s.seller_no "
					+ " where s.seller_id=? order by p.pdcode desc";
			ps=con.prepareStatement(sql);
			ps.setString(1, seller_id);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int pdcode = rs.getInt("pdcode");
				String pdname = rs.getString("pdname");
				int price = rs.getInt("price");
				int qty = rs.getInt("qty");
				Timestamp regdate = rs.getTimestamp("regdate");
				long seller_no = rs.getLong("seller_no");
				String image = rs.getString("image");
				String detail = rs.getString("detail");
				int div_no = rs.getInt("div_no");
				
				ProductAllVO vo = new ProductAllVO(pdcode, pdname, price, qty, regdate, seller_no, image, detail, div_no);
				
				
				list.add(vo);
			}
			System.out.println("사업자번호별 조회 결과 seller_no = "+seller_id+
					" list.size = "+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public ProductAllVO detailProduct(int pdcode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ProductAllVO vo = null;
		try {
			con = pool.getConnection();
			String sql = "select * from productlist "
					+ " where pdcode = ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, pdcode);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				String pdname = rs.getString("pdname");
				int price = rs.getInt("price");
				int qty = rs.getInt("qty");
				Timestamp regdate = rs.getTimestamp("regdate");
				long seller_no = rs.getLong("seller_no");
				String image = rs.getString("image");
				String detail = rs.getString("detail");
				int div_no = rs.getInt("div_no");
				
				vo = new ProductAllVO(pdcode, pdname, price, qty, regdate, seller_no, image, detail, div_no);
			}
			System.out.println("조회 결과 pdcode = "+pdcode);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	
	
}
