package com.reboard.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.userinfo.db.ConnectionPool2;

public class ReboardDAO {
	private ConnectionPool2 pool;

	public ReboardDAO() {
		pool = new ConnectionPool2();
	}
	
	public int insertBoard(ReboardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		int ref=0;
		int re_step=1;
		int re_level=1;
		
		try {
			con=pool.getConnection();
			
			String refSQL = "select max(ref) from reboard";
			
			ps = con.prepareStatement(refSQL);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				ref=rs.getInt(1)+1;
			}
			
			String sql="insert into reboard\r\n" + 
					"values(reboard_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getWriter());
			ps.setString(2, vo.getEmail());
			ps.setString(3, vo.getSubject());
			ps.setString(4, vo.getPassword());
			ps.setInt(5, ref);
			ps.setInt(6, re_step);
			ps.setInt(7, re_level);
			ps.setString(8, vo.getContent());
			
			int cnt=ps.executeUpdate();
			
			System.out.println("게시글 등록 결과 cnt"+cnt+", 매개변수 vo="+vo);
			return cnt;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public List<ReboardVO> getAllBoard(int start, int end) throws SQLException{
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<ReboardVO> list = new ArrayList<ReboardVO>();
		
		try {
			con=pool.getConnection();
			
			String sql="select * from (\r\n" + 
					"select A.*, Rownum Rnum from\r\n" + 
					"(select * from reboard order by ref desc, re_step ASC)A)\r\n" + 
					"where Rnum >=? and Rnum<=?";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				ReboardVO vo = new ReboardVO();
				
				vo.setNum(rs.getInt(1));
				vo.setWriter(rs.getString(2));
				vo.setEmail(rs.getString(3));
				vo.setSubject(rs.getString(4));
				vo.setPassword(rs.getString(5));
				vo.setReg_date(rs.getDate(6).toString());
				vo.setRef(rs.getInt(7));
				vo.setRe_step(rs.getInt(8));
				vo.setRe_level(rs.getInt(9));
				vo.setReadcount(rs.getInt(10));
				vo.setContent(rs.getString(11));
				
				list.add(vo);
			}
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	public ReboardVO getOneBoard(int num) throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ReboardVO vo = new ReboardVO();
		
		try {
			con=pool.getConnection();
			
			String readsql="update reboard set readcount=readcount+1 where num=?";
			
			ps=con.prepareStatement(readsql);
			ps.setInt(1, num);
			ps.executeUpdate();
			
			String sql = "select*from reboard where num=?";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				vo.setNum(rs.getInt(1));
				vo.setWriter(rs.getString(2));
				vo.setEmail(rs.getString(3));
				vo.setSubject(rs.getString(4));
				vo.setPassword(rs.getString(5));
				vo.setReg_date(rs.getDate(6).toString());
				vo.setRef(rs.getInt(7));
				vo.setRe_step(rs.getInt(8));
				vo.setRe_level(rs.getInt(9));
				vo.setReadcount(rs.getInt(10));
				vo.setContent(rs.getString(11));
			}
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	public int reWriteBoard(ReboardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int ref=vo.getRef();
		int re_step=vo.getRe_step();
		int re_level=vo.getRe_level();
		
		try {
			con=pool.getConnection();
			
			String levelsql="update reboard set"
					+ " re_level=re_level+1 where ref=? and re_level>?";
			ps=con.prepareStatement(levelsql);
			ps.setInt(1, ref);
			ps.setInt(2, re_level);
			
			ps.executeUpdate();
			String sql="insert into reboard"
					+ " values(reboard_seq.nextval,?,?,?,?,sysdate,?,?,?,0,?)";
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getWriter());
			ps.setString(2, vo.getEmail());
			ps.setString(3, vo.getSubject());
			ps.setString(4, vo.getPassword());
			ps.setInt(5, ref);
			ps.setInt(6, re_step+1);
			ps.setInt(7, re_level+1);
			ps.setString(8, vo.getContent());
			
			int cnt=ps.executeUpdate();
			
			return cnt;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public ReboardVO getOneUpdateBoard(int num) throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ReboardVO vo = new ReboardVO();
		
		try {
			con=pool.getConnection();
			
			String sql="select*from reboard where num=?";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				vo.setNum(rs.getInt(1));
				vo.setWriter(rs.getString(2));
				vo.setEmail(rs.getString(3));
				vo.setSubject(rs.getString(4));
				vo.setPassword(rs.getString(5));
				vo.setReg_date(rs.getDate(6).toString());
				vo.setRef(rs.getInt(7));
				vo.setRe_step(rs.getInt(8));
				vo.setRe_level(rs.getInt(9));
				vo.setReadcount(rs.getInt(10));
				vo.setContent(rs.getString(11));
			}
			return vo;
			
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	public String getPass(int num) throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String pass="";
		
		try {
			con=pool.getConnection();
			
			String sql="select password from reboard where num=?";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				pass=rs.getString(1);
			}
			return pass;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	public void updateBoard(ReboardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			
			String sql="update reboard set subject=?, content=?"
					+ " where num=?";
			
			ps=con.prepareStatement(sql);
			
			ps.setString(1, vo.getSubject());
			ps.setString(2, vo.getContent());
			ps.setInt(3, vo.getNum());
			
			ps.executeUpdate();
			
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public void deleteBoard(int num) throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			
			String sql="delete from reboard where num=?";
			
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			
			ps.executeUpdate();
			
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int getAllCount() throws SQLException {
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int count=0;
		
		try {
			con=pool.getConnection();
			
			String sql="select count(*) from reboard";
			
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
			return count;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
}
