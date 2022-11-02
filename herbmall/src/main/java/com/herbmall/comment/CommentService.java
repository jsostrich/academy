package com.herbmall.comment;

import java.sql.SQLException;
import java.util.List;

public class CommentService {
	private CommentDAO commentDao;
	
	public CommentService() {
		commentDao = new CommentDAO();
	}
	
	public int insertComment(CommentVO vo,String no) throws SQLException {
		int cnt = commentDao.insertComment(vo,no);
		return cnt;
	}

	public List<CommentVO> selectNo(int bdno) throws SQLException{
		List<CommentVO> list = commentDao.selectNo(bdno);
		return list;
	}
	
	
}
