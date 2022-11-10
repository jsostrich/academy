package com.userinfo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.userinfo.db.ConnectionPool2;

import oracle.jdbc.proxy.annotation.Pre;

public class UserInfoDAO {

	private ConnectionPool2 pool;
	
	public UserInfoDAO() {
		pool = new ConnectionPool2();
	}
	
	public List<SubproductVO> selectAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<SubproductVO> list = new ArrayList<>();
		try {
			con = pool.getConnection();
			String sql = "select * from subproduct";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int div_no = rs.getInt("div_no");
				String subproduct_name = rs.getString("subproduct_name");
				int maincode = rs.getInt("maincode");
				
				SubproductVO vo = 
					new SubproductVO(div_no, subproduct_name, maincode);
				
				list.add(vo);
				
			}
			System.out.println("출력된 리스트 사이즈 = "+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int insertUser(UserInfoVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int cnt =0;
		
		try {
			con = pool.getConnection();
			
			String sql = "insert into UserInfo "
					+ " values(userinfo_seq.nextval,?,?,?,?,? "
					+ " ,?,?,?,sysdate,1,"+null+")";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getUser_name());
			ps.setString(2, vo.getUser_nick());
			ps.setString(3, vo.getUser_id());
			ps.setString(4, vo.getUser_pwd());
			ps.setString(5, vo.getUser_tel());
			ps.setString(6, vo.getUser_zipcode());
			ps.setString(7, vo.getUser_address());
			ps.setString(8, vo.getUser_email());
			
			cnt = ps.executeUpdate();
			
			System.out.println("회원 가입 결과 : cnt = "+cnt+", 매개변수 vo = "
					+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int checkUserId(String user_id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int cnt = 0;
		try {
			
			con=pool.getConnection();
			
			String sql = "select count(*) from userinfo where user_id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, user_id);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int count = rs.getInt(1);
				if(count>0) {
					cnt = UserInfoService.NO_ID;
				}else {
					cnt = UserInfoService.OK_ID;
				}
			}
			System.out.println("아이디 중복확인 결과 cnt = "+cnt+
					", 매개변수 user_id = "+user_id);
			return cnt;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int checkUserNick(String user_nick) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int cnt = 0;
		try {
			
			con=pool.getConnection();
			
			String sql = "select count(*) from userinfo where user_nick=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, user_nick);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int count = rs.getInt(1);
				if(count>0) {
					cnt = UserInfoService.NO_ID;
				}else {
					cnt = UserInfoService.OK_ID;
				}
			}
			System.out.println("닉네임 중복확인 결과 cnt = "+cnt+
					", 매개변수 user_nick = "+user_nick);
			return cnt;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int userCheck(String userid, String pwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			//1,2
			con = pool.getConnection();
			//3
			String sql="select user_pwd from userinfo where user_id=? "
					+ " and outdate is null";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			//4
			int result = 0;
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				
				if(dbPwd.equals(pwd)) {
					result=UserInfoService.LOGIN_OK;
				}else if(!dbPwd.equals(pwd)) {
					result=UserInfoService.NO_PWD;
				}
			}else {
				result=UserInfoService.NONE_ID;
			}
			System.out.println("로그인 처리결과 result = "+result+
					", 매개변수 userid = "+userid+", pwd ="+pwd);
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public UserInfoVO selectUser(String user_id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		UserInfoVO vo = new UserInfoVO();
		
		try {
			con = pool.getConnection();
			String sql = "select * from userinfo where user_id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, user_id);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int user_no = rs.getInt("user_no");
				String user_name = rs.getString("user_name");
				String user_nick = rs.getString("user_nick");
				String user_pwd = rs.getString("user_pwd");
				String user_tel = rs.getString("user_tel");
				String user_email = rs.getString("user_email");
				String user_zipcode = rs.getString("user_zipcode");
				String user_address = rs.getString("user_address");
				Timestamp user_joindate = rs.getTimestamp("user_joindate");
				int user_class = rs.getInt("user_class");
				String outdate = rs.getString("outdate");
				
				vo.setUser_no(user_no);
				vo.setUser_name(user_name);
				vo.setUser_nick(user_nick);
				vo.setUser_id(user_id);
				vo.setUser_pwd(user_pwd);
				vo.setUser_tel(user_tel);
				vo.setUser_email(user_email);
				vo.setUser_zipcode(user_zipcode);
				vo.setUser_address(user_address);
				vo.setUser_joindate(user_joindate);
				vo.setUser_class(user_class);
				vo.setOutdate(outdate);
			}
			System.out.println("회원 조회 결과 vo = "+vo+", 매개변수 user_id="
					+user_id);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	public int deleteUser(String userid, String pwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
			con=pool.getConnection();
			String sql ="update userinfo "
					+ " set outdate='Y' "
					+ " where user_id=? and user_pwd=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setString(2, pwd);
			
			int cnt = ps.executeUpdate();
			
			System.out.println("탈퇴 경과 cnt = "+cnt);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	
}
