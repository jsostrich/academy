package com.herbmall.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.herbmall.db.ConnectionPoolMgr2;

public class CommentDAO {
	private ConnectionPoolMgr2 pool;
	
	public CommentDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public int insertComment(CommentVO vo,String no) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			
			String sql="insert into comments\r\n"
					+ "values(comments_seq.nextval,"
					+ " ?,?,sysdate,?,?);";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getContent());
			ps.setString(4, no);
			
			int cnt = ps.executeUpdate();
			
			System.out.println("코멘트 결과 cnt = "+cnt+", 매개변수 vo = "+
					vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public List<CommentVO> selectNo(int bdno) throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		CommentVO vo = new CommentVO();
		List<CommentVO> list = new ArrayList<>();
		try {
			con = pool.getConnection();
			
			String sql =" select * from comments "
						+" where bdno=? ";
			ps=con.prepareStatement(sql);
			ps.setInt(1, bdno);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String name = rs.getString("name");
				String pwd = rs.getString("pwd");
				Timestamp regdate = rs.getTimestamp("regdate");
				String content = rs.getString("content");
				
				vo.setNo(no);
				vo.setName(name);
				vo.setPwd(pwd);
				vo.setRegdate(regdate);
				vo.setContent(content);
				vo.setBdNo(bdno);
				
				list.add(vo);
			}
			System.out.println("조회 결과 list.size="+list.size()+", 매개변수 bdno="
					+bdno);
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
