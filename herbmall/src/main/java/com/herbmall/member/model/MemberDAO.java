package com.herbmall.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.herbmall.db.ConnectionPoolMgr2;
import com.herbmall.zipcode.model.ZipcodeVO;

public class MemberDAO {
	private ConnectionPoolMgr2 pool;

	public MemberDAO() {
		pool=new ConnectionPoolMgr2();
	}

	public int insertMember(MemberVO memberVo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		try {
			//1,2 
			con=pool.getConnection();

			//3
			String sql = "insert into member(no, userid, name, pwd, email, "
					+ "hp, zipcode, address, addressDetail)"
					+ " values(member_seq.nextval, ?, ?, ?, ?,?, ?, ?, ?)";
			ps = con.prepareStatement(sql);

			ps.setString(1, memberVo.getUserid());
			ps.setString(2, memberVo.getName());
			ps.setString(3, memberVo.getPwd());
			ps.setString(4, memberVo.getEmail());
			ps.setString(5, memberVo.getHp());
			ps.setString(6, memberVo.getZipcode());
			ps.setString(7, memberVo.getAddress());
			ps.setString(8, memberVo.getAddressDetail());

			//4
			int cnt=ps.executeUpdate();
			System.out.println("회원가입 결과 cnt="+cnt+", 매개변수 vo="+memberVo);
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	/**
	 * 아이디 중복확인
	 * @param userid
	 * @return
	 * @throws SQLException 
	 */
	public int duplicateUserid(String userid) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select count(*) from member where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			//4
			int result=0;
			rs=ps.executeQuery();
			if(rs.next()) {
				int count=rs.getInt(1);
				if(count>0) {
					result=MemberService.EXIST_ID; //이미 존재
				}else {
					result=MemberService.NON_EXIST_ID; //사용가능					
				}
			}
			System.out.println("아이디 중복확인 결과 result="+result
				+", 매개변수 userid="+userid);
			
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public List<ZipcodeVO> selectZipcode(String dong) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<ZipcodeVO> list=new ArrayList<>();
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select * from zipcode"
					+ " where dong like '%' || ? || '%'";
			ps=con.prepareStatement(sql);
			ps.setString(1, dong);
			
			//4
			rs=ps.executeQuery();
			while(rs.next()) {
				String zipcode=rs.getString("zipcode");
				String sido=rs.getString("sido");
				String gugun=rs.getString("gugun");
				String dong2=rs.getString("dong");
				String startbunji=rs.getString("startbunji");
				String endbunji=rs.getString("endbunji");
				int seq=rs.getInt("seq");
				
				ZipcodeVO vo = new ZipcodeVO(zipcode, sido, gugun, 
					dong2, startbunji, endbunji, seq);
				list.add(vo);
			}
			System.out.println("우편번호 찾기 결과 list.size="+list.size()
				+"매개변수 dong="+dong);
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int loginCheck(String userid, String pwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			//1,2
			con = pool.getConnection();
			//3
			String sql="select pwd from member where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			//4
			int result = 0;
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbPwd=rs.getString(1);
				
				if(dbPwd.equals(pwd)) {
					result=MemberService.LOGIN_OK;
				}else if(!dbPwd.equals(pwd)) {
					result=MemberService.DISAGREE_PMD;
				}
			}else {
				result=MemberService.NONE_USEID;
			}
			System.out.println("로그인 처리결과 result = "+result+
					", 매개변수 userid = "+userid+", pwd ="+pwd);
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public MemberVO selectUser(String userid) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		MemberVO vo = new MemberVO();
		try {
			con = pool.getConnection();
			String sql = "select * from member where userid=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				int no = rs.getInt("no");
			    String name =rs.getString("name");
			    String pwd = rs.getString("pwd");
			    String email = rs.getString("email");
			    String hp = rs.getString("hp");
			    String zipcode = rs.getString("zipcode");
			    String address = rs.getString("address");
			    String addressDetail = rs.getString("addressDetail");
			    Timestamp regdate = rs.getTimestamp("regdate");
			    int mileage = rs.getInt("mileage");
			    Timestamp outdate = rs.getTimestamp("outdate");
			
			    vo.setNo(no);
			    vo.setName(name);
			    vo.setPwd(pwd);
			    vo.setEmail(email);
			    vo.setHp(hp);
			    vo.setZipcode(zipcode);
			    vo.setAddress(address);
			    vo.setAddressDetail(addressDetail);
			    vo.setRegdate(regdate);
			    vo.setMileage(mileage);
			    vo.setOutdate(outdate);
			    vo.setUserid(userid);
			}
			System.out.println("회원 조회 결과 vo = "+vo+", 매개변수 userid="
					+userid);
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	
	
}





