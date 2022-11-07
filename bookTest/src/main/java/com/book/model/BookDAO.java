package com.book.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.book.db.ConnectionPoolMgr2;

public class BookDAO {
	private ConnectionPoolMgr2 pool;
	
	public BookDAO() {
		pool=new ConnectionPoolMgr2();
	}
	public int onBook(BookDTO dto) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int cnt =0;
		try {
			// 1.연동하기
			con = pool.getConnection();
			
			// 2.db접속
			String sql = "insert into book(no,title,price,publisher)\r\n" 
					+ "values(book_seq.nextval,?,?,?)";
			ps = con.prepareStatement(sql);

			// 3.sql작성
			ps.setString(1, dto.getTitle());
			ps.setInt(2, dto.getPrice());
			ps.setString(3, dto.getPublisher());
			
			// 4.실행
			cnt = ps.executeUpdate();
			System.out.println("추가된 행 갯수 : " + cnt);
		} finally {
			pool.dbClose(ps, con);
		}
		return cnt;
	}//onbook

	public BookDTO selectNO(int no) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		BookDTO dto = new BookDTO();
		try {
			//1. 뎐동하기
			con = pool.getConnection();
			
			//2. db접속
			String sql="select * from book where no = ?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			
			//3.exec
			rs=ps.executeQuery();
			while(rs.next()) {
				String title = rs.getString("title");
				int price = rs.getInt("price");
				String publisher = rs.getString("publisher");
				Timestamp joindate = rs.getTimestamp("joindate");
				
				dto.setNo(no);
				dto.setTitle(title);
				dto.setPrice(price);
				dto.setPublisher(publisher);
				dto.setJoindate(joindate);
			}
			System.out.println("번호로 조회 결과 : "+no);
			
			return dto;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public List<BookDTO> selectTitle(String title) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<BookDTO> list = new ArrayList<>();
		
		try {
			//1.con
			con=pool.getConnection();
			
			//2.ps
			String sql ="select * from book where title = ?";
			ps=con.prepareStatement(sql);
			ps.setString(1, title);
			
			//3.rs
			rs=ps.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				int price = rs.getInt("price");
				String publisher = rs.getString("publisher");
				Timestamp joindate = rs.getTimestamp("joindate");
				
				BookDTO dto = new BookDTO(no,title,price,publisher,joindate);
				
				list.add(dto);
			}
			System.out.println("전체 조회결과 : "+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}//selectTitle
	public List<BookDTO> selectAll(String condition,
			String keyword) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<BookDTO> list = new ArrayList<>();
		try {
			//1.con
			con=pool.getConnection();
			//2.ps
			String sql = "select * from book ";
			
			if(condition!=null && !keyword.isEmpty()) {
				sql+=" where "+condition+" like '%' || ? || '%'";
			}
			sql+= " order by no desc";
			ps= con.prepareStatement(sql);
			if(condition!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			
			//3.rs
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				int price = rs.getInt("price");
				String publisher = rs.getString("publisher");
				Timestamp joindate = rs.getTimestamp("joindate");
				
				BookDTO dto = new BookDTO(no,title,price,publisher,joindate);
				list.add(dto);
			}
			System.out.println("출력된 행사이즈 : "+list.size());
			return list;
			
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}//seletall
	public int update(BookDTO dto) 
			throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int cnt = 0;
		try {
			//1.con
			con=pool.getConnection();
			//2.ps
			String sql="update book set title=?,price=?,publisher=? where"
					+ " no=?";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, dto.getTitle());
			ps.setInt(2, dto.getPrice());
			ps.setString(3, dto.getPublisher());
			ps.setInt(4, dto.getNo());
			cnt = ps.executeUpdate();
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}//update
	public int delete(int no) throws SQLException {
		Connection con =null;
		PreparedStatement ps=null;
		int cnt = 0;
		try {
			//1.con
			con=pool.getConnection();
			//2.ps
			String sql="delete from book where no =?";
			ps= con.prepareStatement(sql);
			ps.setInt(1, no);
			//3.exec
			cnt = ps.executeUpdate();
			
			System.out.println("삭제된 행 개수 : "+cnt);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
}// bookdto

