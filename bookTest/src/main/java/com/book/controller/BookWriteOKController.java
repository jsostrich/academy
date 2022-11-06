package com.book.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.model.BookDTO;
import com.book.model.BookService;
import com.controller.Controller;

public class BookWriteOKController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, 
			HttpServletResponse response) throws Throwable {
		/*
		  [2] 상품 등록 처리 - insert 
		  	(common/message.jsp)메세지 안보여주고 다른페이지로 바로 이동
		  /book/bookWrite_ok.do => DispatchServlet => BookWriteOkController
		    => bookList.do로 redirect
		 */
		
		//1. 요청 파라미터 읽어오기
		String bookName= request.getParameter("bookName");
		String bookPrice = request.getParameter("bookPrice");
		String pub = request.getParameter("pub");
				
		
		//2. db 처리 //서비스 객체생성 필수==> jsp에서는 use:bean으로했음
		BookService bookser = new BookService();
		BookDTO dto = new BookDTO();
		dto.setTitle(bookName);
		dto.setPrice(Integer.parseInt(bookPrice));
		dto.setPublisher(pub);
		
		
		try {
			int cnt = bookser.onBook(dto);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		//3. 결과 저장
		//4. 이동할 페이지 리턴
		return "/book/bookList.do";
	}

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

}
