package com.mymvc.pd.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.mymvc.db.ConnectionPoolMgr2;

public class PdService {
	private PdDAO pdDao;
	
	public PdService() {
		pdDao = new PdDAO();
	}
	
	public int insertPd(PdDTO dto) throws SQLException {
		return pdDao.insertPd(dto);
	}
	
	public PdDTO selectByNo(int no) throws SQLException {
		return pdDao.selectByNo(no);
	}
	
	public int updatePd(PdDTO dto) throws SQLException {
		return pdDao.updatePd(dto);
	}
	
	public int deletePd(int no) throws SQLException {
		return pdDao.deletePd(no);
	}
	
	public List<PdDTO> selectByPdName(String pdName) throws SQLException {
		return pdDao.selectByPdName(pdName);
	}

}
