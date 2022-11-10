package com.sellerinfo.model;

import java.sql.SQLException;

public class SellerInfoService {
	
	private SellerInfoDAO sellerDao;
	
	//아이디 중복확인
	public static final int NO_ID=1;//이미 있는 아아디
	public static final int OK_ID=2;//아이디 사용 가능
	
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int NO_PWD=2; //비밀번호 불일치
	public static final int NONE_ID=3; //아이디가 없음
	
	public SellerInfoService() {
		sellerDao = new SellerInfoDAO();
	}
	
	public int insertUser(SellerInfoVO vo) throws SQLException {
		return sellerDao.insertUser(vo);
	}

	public int checkUserId(String sellor_id) throws SQLException {
		return sellerDao.checkUserId(sellor_id);
	}

	public int checkUserNick(String sellor_nick) throws SQLException {
		return sellerDao.checkUserNick(sellor_nick);
	}
	
	public int sellerCheck(String userid, String pwd) throws SQLException {
		return sellerDao.sellerCheck(userid, pwd);
	}
		
	public SellerInfoVO selectSeller(String seller_id) throws SQLException {
		return sellerDao.selectSeller(seller_id);
	}

	public int sellerUpdate(String address, String tel,String email, String zipcode
			,String id )throws SQLException {
		return sellerDao.sellerUpdate(address, tel, email, zipcode ,id);
	}
	
	public boolean deleteSeller(String sellerid, String pwd) throws SQLException {
		return sellerDao.deleteSeller(sellerid, pwd);
	}

	
}
