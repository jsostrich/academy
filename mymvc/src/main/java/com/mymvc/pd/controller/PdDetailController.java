package com.mymvc.pd.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.mymvc.pd.model.PdDTO;
import com.mymvc.pd.model.PdService;

public class PdDetailController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, 
			HttpServletResponse response) throws Throwable {
		
		String no = request.getParameter("no");
		
		PdService pdService = new PdService();
		PdDTO dto = null;
		
		try {
			
			dto = pdService.selectByNo(Integer.parseInt(no));
		}catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		request.setAttribute("dto", dto);
		
		return "/pd/pdDetail.jsp";
	}

	@Override
	public boolean isRedirect() {
		
		return false;
	}

}
