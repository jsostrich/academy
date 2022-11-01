package com.herbmall.member.model;

import java.sql.SQLException;
import java.util.List;

import com.herbmall.zipcode.model.ZipcodeVO;

//jsp - DAO
//jsp - Service - DAO

//DB작업 이외의 로직을 넣는 클래스
public class MemberService {
	//아이디 중복확인에서 사용할 상수
	public static final int EXIST_ID=1; //이미 존재하는 아이디
	public static final int NON_EXIST_ID=2; //존재하지 않는 아이디-사용가능
	
	//로그인 처리시에 사용할 상수
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int DISAGREE_PMD=2; //비밀번호 불일치
	public static final int NONE_USEID=3; //아이디가 없음

	private MemberDAO memberDao;
	
	public MemberService() {
		memberDao=new MemberDAO();
	}
	
	public int insertMember(MemberVO memberVo) throws SQLException {
		int cnt=memberDao.insertMember(memberVo);
		return cnt;
	}
	
	public int duplicateUserid(String userid) throws SQLException {
		return memberDao.duplicateUserid(userid);
	}
	
	public List<ZipcodeVO> selectZipcode(String dong) throws SQLException {
		return memberDao.selectZipcode(dong);
	}
	
	public int loginCheck(String userid, String pwd) throws SQLException {
		int result = memberDao.loginCheck(userid, pwd);
		return result;
	}

	public MemberVO selectUser(String userid) throws SQLException {
		MemberVO vo = memberDao.selectUser(userid);
		return vo;
	}

	public int updateUser(MemberVO vo) throws SQLException {
		int cnt = memberDao.updateUser(vo);
		return cnt;
	}
		
	
}
