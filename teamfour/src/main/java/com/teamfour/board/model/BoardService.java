package com.teamfour.board.model;

import java.sql.SQLException;
import java.util.List;

public class BoardService {
	private BoardDAO boardDao;
	
	public BoardService(){
		boardDao = new BoardDAO();
	}
	
	int insertBoard(BoardVO vo) throws SQLException{
		return boardDao.insertBoard(vo);
	}
	
	public List<BoardVO> selectBoardAll(String condition, String keyword) throws SQLException{
		return boardDao.selectBoardAll(condition, keyword);
	}
	
}
