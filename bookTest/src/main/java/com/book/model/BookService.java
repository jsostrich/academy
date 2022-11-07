package com.book.model;

import java.sql.SQLException;
import java.util.List;

public class BookService {
	
	private BookDAO bookDao;
	
	public BookService() {
		bookDao = new BookDAO();
	}
	
	public int onBook(BookDTO dto) throws SQLException {
		return bookDao.onBook(dto);
	}//책 추기하기

	public BookDTO selectNO(int no) throws SQLException {
		return bookDao.selectNO(no);
	}// 책넘버로 찾기
	
	public List<BookDTO> selectTitle(String title) throws SQLException{
		return bookDao.selectTitle(title);
	}//selectTitle 책 타이틀로 찾기
	
	public List<BookDTO> selectAll(String condition,
			String keyword) throws SQLException{
		return bookDao.selectAll(condition, keyword);
	}//seletall 책 전체 찾기
	
	public int update(BookDTO dto) throws SQLException {
		return bookDao.update(dto);
	}//update 책 업데이트 하기
	
	public int delete(int no) throws SQLException {
		return bookDao.delete(no);
	}//delete 책 삭제하기
}
