package com.book.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;

public class BookWriteController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, 
			HttpServletResponse response) throws Throwable {
		
		/*
		  [1] bookwrite 상품 등록 보기
		  
		  /book/bookWrite.do => DispatcherServlet => 
		    배분해서 모델에 할당 BookWriteController =>  bookWrite.jsp 포워드
		 */
		return "/book/bookWrite.jsp";
	}

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

}
