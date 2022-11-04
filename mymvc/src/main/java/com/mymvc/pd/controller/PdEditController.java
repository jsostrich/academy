package com.mymvc.pd.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.mymvc.pd.model.PdDTO;
import com.mymvc.pd.model.PdService;

public class PdEditController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, 
			HttpServletResponse response) throws Throwable {
		/*
		[5] 제품 수정하기 - update
 			화면을 먼저 보여주기
			/pd/pdEdit.do => DispatchServlet => 
		 	PdEditController => pdEdit.jsp로 포워드
		*/
		String no = request.getParameter("no");
		
		PdService pdService = new PdService();
		PdDTO dto = null;
		try {
			dto=pdService.selectByNo(Integer.parseInt(no));
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("pdDto", dto);
		
		return "/pd/pdEdit.jsp";
	}

	@Override
	public boolean isRedirect() {
		
		return false;
	}

}
