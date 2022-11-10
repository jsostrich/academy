package com.userinfo.model;

import java.sql.SQLException;

public class UserInfoService {
	private UserInfoDAO userInfoDao;
	
	//아이디 중복확인
	public static final int NO_ID=1;//이미 있는 아아디
	public static final int OK_ID=2;//아이디 사용 가능
	
	//로그인 처리시에 사용할 상수
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int NO_PWD=2; //비밀번호 불일치
	public static final int NONE_ID=3; //아이디가 없음
	
	public UserInfoService() {
		userInfoDao = new UserInfoDAO();
	}
	
	public int insertUser(UserInfoVO vo) throws SQLException {
		return userInfoDao.insertUser(vo);
	}

	public int checkUserId(String user_id) throws SQLException {
		return userInfoDao.checkUserId(user_id);
	}

	public int checkUserNick(String user_nick) throws SQLException {
		return userInfoDao.checkUserNick(user_nick);
	}
	
	public int userCheck(String userid, String pwd) throws SQLException {
		return userInfoDao.userCheck(userid, pwd);
	}

	public UserInfoVO selectUser(String user_id) throws SQLException {
		return userInfoDao.selectUser(user_id);
	}

	public int deleteUser(String userid, String pwd) throws SQLException {
		return userInfoDao.deleteUser(userid, pwd);
	}

}

