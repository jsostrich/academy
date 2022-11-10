package com.reboard.model;

import java.sql.SQLException;
import java.util.List;

public class ReboardService {
	private ReboardDAO dao;
	
	public ReboardService() {
		dao = new ReboardDAO();
	}
	
	public int insertBoard(ReboardVO vo) throws SQLException {
		return dao.insertBoard(vo);
	}
	
	public List<ReboardVO> getAllBoard(int start, int end) throws SQLException{
		return dao.getAllBoard(start, end);
	}
	
	public ReboardVO getOneBoard(int num) throws SQLException {
		return dao.getOneBoard(num);
	}
	
	public int reWriteBoard(ReboardVO vo) throws SQLException {
		return dao.reWriteBoard(vo);
	}
	
	public ReboardVO getOneUpdateBoard(int num) throws SQLException {
		return dao.getOneUpdateBoard(num);
	}
	
	public String getPass(int num) throws SQLException {
		return dao.getPass(num);
	}
	
	public void updateBoard(ReboardVO vo) throws SQLException {
		dao.updateBoard(vo);
	}
	
	public void deleteBoard(int num) throws SQLException {
		dao.deleteBoard(num);
	}
	
	public int getAllCount() throws SQLException {
		return dao.getAllCount();
	}
}
