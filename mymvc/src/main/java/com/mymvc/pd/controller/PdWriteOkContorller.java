package com.mymvc.pd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;

public class PdWriteOkContorller implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		/*
		  [2] 상품 등록 처리 - insert 
		  	(common/message.jsp)메세지 안보여주고 다른페이지로 바로 이동
		  /pd/pdWrite_ok.do => DispatchServlet => PdWriteOkController
		    => pdList.do로 redirect
		 */
		
		//1. 요청 파라미터 읽어오기
		String pdName = request.getParameter("pdName");
		String price = request.getParameter("price");
		
		//2. db 처리
		
		
		//3. 결과 출력
		

		return "";
	}

	@Override
	public boolean isRedirect() {

		return false;
	}

}
