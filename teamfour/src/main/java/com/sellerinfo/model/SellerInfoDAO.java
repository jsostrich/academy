package com.sellerinfo.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.userinfo.db.ConnectionPool2;
import com.userinfo.model.UserInfoService;
import com.userinfo.model.UserInfoVO;

import oracle.jdbc.proxy.annotation.Pre;

public class SellerInfoDAO {

	private ConnectionPool2 pool;
	
	public SellerInfoDAO() {
		pool = new ConnectionPool2();
	}
	
	public int insertUser(SellerInfoVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int cnt =0;
		
		try {
			con = pool.getConnection();
			
			String sql = "insert into sellerinfo "
					+ " values(sellerinfo_seq.nextval,?,?,?,?,?"
					+ " ,?,?,?,sysdate,2,"+null+")";
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getSeller_name());
			ps.setString(2, vo.getSeller_nick());
			ps.setString(3, vo.getSeller_id());
			ps.setString(4, vo.getSeller_pwd());
			ps.setString(5, vo.getSeller_tel());
			ps.setString(6, vo.getSeller_email());
			ps.setString(7, vo.getSeller_zipcode());
			ps.setString(8, vo.getSeller_address());
			
			cnt = ps.executeUpdate();
			
			System.out.println("회원 가입 결과 : cnt = "+cnt+", 매개변수 vo = "
					+vo);
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int checkUserId(String seller_id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int cnt = 0;
		try {
			
			con=pool.getConnection();
			
			String sql = "select count(*) from sellerinfo where seller_id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, seller_id);
			
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
					", 매개변수 user_id = "+seller_id);
			return cnt;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int checkUserNick(String sellor_nick) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int cnt = 0;
		try {
			
			con=pool.getConnection();
			
			String sql = "select count(*) from sellerinfo where seller_nick=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, sellor_nick);
			
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
					", 매개변수 user_nick = "+sellor_nick);
			return cnt;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int sellerCheck(String userid, String pwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			//1,2
			con = pool.getConnection();
			//3
			String sql="select seller_pwd from sellerinfo where seller_id=? "
					+ " and outdate is null";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			//4
			int result = 0;
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				
				if(dbPwd.equals(pwd)) {
					result=SellerInfoService.LOGIN_OK;
				}else if(!dbPwd.equals(pwd)) {
					result=SellerInfoService.NO_PWD;
				}
			}else {
				result=SellerInfoService.NONE_ID;
			}
			System.out.println("로그인 처리결과 result = "+result+
					", 매개변수 userid = "+userid+", pwd ="+pwd);
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public SellerInfoVO selectSeller(String seller_id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		SellerInfoVO vo = new SellerInfoVO();
		
		try {
			con = pool.getConnection();
			String sql = "select * from sellerinfo where seller_id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, seller_id);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				long seller_no = rs.getLong("seller_no");
				String seller_name = rs.getString("seller_name");
				String seller_nick = rs.getString("seller_nick");
				String seller_pwd = rs.getString("seller_pwd");
				String seller_tel = rs.getString("seller_tel");
				String seller_email = rs.getString("seller_email");
				String seller_zipcode = rs.getString("seller_zipcode");
				String seller_address = rs.getString("seller_address");
				Timestamp seller_joindate = rs.getTimestamp("seller_joindate");
				int seller_class = rs.getInt("seller_class");
				String outdate = rs.getString("outdate");
				
				vo.setSeller_no(seller_no);
				vo.setSeller_name(seller_name);
				vo.setSeller_nick(seller_nick);
				vo.setSeller_id(seller_id);
				vo.setSeller_pwd(seller_pwd);
				vo.setSeller_tel(seller_tel);
				vo.setSeller_email(seller_email);
				vo.setSeller_zipcode(seller_zipcode);
				vo.setSeller_address(seller_address);
				vo.setSeller_joindate(seller_joindate);
				vo.setSeller_class(seller_class);
				vo.setOutdate(outdate);
				
			}
			System.out.println("회원 조회 결과 vo = "+vo+", 매개변수 user_id="
					+seller_id);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
		
		public int sellerUpdate(String address, String tel,String email, String zipcode
				,String id )throws SQLException {
			Connection con = null;
			PreparedStatement ps = null;
			
			try {
				con= pool.getConnection();
				String sql = "update sellerinfo "
						+ " set seller_address=? ,seller_tel=? "
						+ ", seller_email=?, seller_zipcode=? "
						+ " where seller_id = ?";
				ps=con.prepareStatement(sql);
				ps.setString(1, address);
				ps.setString(2, tel);
				ps.setString(3, email);
				ps.setString(4, zipcode);
				ps.setString(5, id);
				
				int cnt = ps.executeUpdate();
				System.out.println("판매자 업데이트 완료 매개변수 address="+address+
						", email="+email+", zipcode = "+zipcode+", id="+id);
				return cnt;
			}finally {
				pool.dbClose(ps, con);
			}
	}
		
		public boolean deleteSeller(String sellerid, String pwd) throws SQLException {
			Connection con = null;
			CallableStatement cs = null;
			
			try {
				con=pool.getConnection();
				
				String sql = "call delete_seller(?,?)";
				cs=con.prepareCall(sql);
				
				cs.setString(1, sellerid);
				cs.setString(2, pwd);
				
				boolean bool = cs.execute();
				
				System.out.println("탈퇴 매개변수 sellerid ="+sellerid+", pwd= "+pwd );
				return bool;
			}finally {
				pool.dbClose(cs, con);
			}
		}
		
		
}
