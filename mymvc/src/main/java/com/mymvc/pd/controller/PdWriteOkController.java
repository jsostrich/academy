package com.mymvc.pd.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.mymvc.pd.model.PdDTO;
import com.mymvc.pd.model.PdService;

public class PdWriteOkController implements Controller {

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
		
		//2. db 처리 //서비스 객체생성 필수==> jsp에서는 use:bean으로했음
		PdService pdService = new PdService();
		PdDTO dto = new PdDTO();
		dto.setPdName(pdName);
		dto.setPrice(Integer.parseInt(price));
		
		try {
			int cnt = pdService.insertPd(dto);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		//3. 결과 저장
		//4. 이동할 페이지 리턴
		return "/pd/pdList.do";
	}

	@Override
	public boolean isRedirect() {

		return true;
	}

}
