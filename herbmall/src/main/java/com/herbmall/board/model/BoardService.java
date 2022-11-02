package com.herbmall.board.model;

import java.sql.SQLException;
import java.util.List;

public class BoardService {
	
	private BoardDAO boardDao;
	
	public BoardService() {
		boardDao = new BoardDAO();
	}
	
	public int insertBoard(BoardVO vo) throws SQLException {
		int cnt = boardDao.insertBoard(vo);
		return cnt;
	}
	
	public List<BoardVO> selectTitle() throws SQLException {
		List<BoardVO> list = boardDao.selectTitle();
		return list;
	}


	
	
	
}
