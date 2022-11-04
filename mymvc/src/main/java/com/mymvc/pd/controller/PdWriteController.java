package com.mymvc.pd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;

public class PdWriteController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		  [1] pdwrite 상품 등록 보기
		  
		  /pd/pdWrite.do => DispatcherServlet => 
		    배분해서 모델에 할당 PdWriteController =>  pdWrite.jsp 포워드
		 */
		return "/pd/pdWrite.jsp";
	}

	@Override
	public boolean isRedirect() {
		
		return false;
	}
	
	
	
}
