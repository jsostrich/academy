package com.herbmall.member.model;

import java.sql.SQLException;
import java.util.List;

import com.herbmall.zipcode.model.ZipcodeVO;

//jsp - DAO
//jsp - Service - DAO

//DB작업 이외의 로직을 넣는 클래스
public class MemberService {
	//아이디 중복확인에서 사용할 실수
	public static final int EXIST_ID=1; //이미 존재함
	public static final int NON_EXIST_ID=2; //존재하지 않은 아이디
	
	private MemberDAO dao;
	
	public MemberService() {
		dao = new MemberDAO();
	}
	
	public int insertMember(MemberVO vo) throws SQLException {
		int cnt = dao.insertMember(vo);
		return cnt;
	}
	
	public int duplicateUserid(String userid) throws SQLException {
		int cnt = dao.duplicateUserid(userid);
		return cnt;
	}
	
	public List<ZipcodeVO> selectZipcode(String dong) throws SQLException {
		List<ZipcodeVO> list = dao.selectZipcode(dong);
		return list;
	}
	
}
