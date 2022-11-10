package com.sp.pd.model;

import java.sql.SQLException;
import java.util.List;

public class PdService {
	private PdDAO pdDao;
	
	public PdService() {
		System.out.println("생성자 호출 : PdService");
	}
	
	//DI - setter에 의한 종속객체 주입
	public void setPdDao(PdDAO pdDao) {
		this.pdDao = pdDao;
		System.out.println("setter호출 - PdService:setPdDao()");
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
	
	public List<PdDTO> selectAll() throws SQLException {
		return pdDao.selectAll();
	}
}
