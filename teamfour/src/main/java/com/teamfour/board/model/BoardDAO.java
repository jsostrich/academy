package com.teamfour.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.userinfo.db.ConnectionPool2;

public class BoardDAO {
	private ConnectionPool2 pool;

	public BoardDAO() {
		pool = new ConnectionPool2();
	}
	
	public int insertBoard(BoardVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
	
		try {
			con = pool.getConnection();
			
			String sql = "insert into board(write_no, user_no, "
					+ "title, writer, content, filename, file_size)"
					+ " values(board_seq.nextval, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);

			ps.setInt(1, vo.getUser_no());
			ps.setString(2, vo.getTitle());
			ps.setString(3, vo.getWriter());
			ps.setString(4, vo.getContent());
			ps.setString(5, vo.getFilename());
			ps.setLong(6, vo.getFile_size());
			
			int cnt = ps.executeUpdate();
			
			System.out.println("int insertBoard(BoardVO vo) 결과 cnt= " + cnt
						+ ", 매개변수 vo=" + vo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<BoardVO> selectBoardAll(String condition, String keyword) 
			throws SQLException{
		/*
			select * from board
			where writer like '%길동%';
	
			select * from board
			where title like '%안녕%';
	
			select * from board
			where content like '%내용%';
		*/
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<BoardVO> list = new ArrayList<>();
		try {
			con = pool.getConnection();
			
			String sql = "select * from board";
			if(keyword != null && !keyword.isEmpty()) {
				sql += " where "+ condition +" like '%' || ? || '%'";
			}			
			sql += " order by write_no desc";
			ps=con.prepareStatement(sql);

			if(keyword!=null && !keyword.isEmpty()) {
				ps.setString(1, keyword);
			}
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int write_no = rs.getInt("write_no");
				int user_no = rs.getInt("user_no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				Timestamp regdate = rs.getTimestamp("regdate");
				int read = rs.getInt("read");
				String content = rs.getString("content");
				String filename = rs.getString("filename");
				long file_size = rs.getLong("file_size");
				
				BoardVO boardVo = new BoardVO(write_no, user_no, title, writer, 
						regdate, read, content, filename, file_size);
				
				list.add(boardVo);
				
				System.out.println("List<BoardVO> selectBoardAll("
						+ "String condition, String keyword) 결과 list.size=" + list.size()
						+ ", 매개변수 condition=" + condition + ", keyword=" + keyword);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
