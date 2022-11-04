package com.mymvc.pd.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.mymvc.pd.model.PdDTO;
import com.mymvc.pd.model.PdService;

public class PdEditOkController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		String no = request.getParameter("no");
		String pdName = request.getParameter("pdName");
		String price = request.getParameter("price");
		
		PdService pdService = new PdService();
		PdDTO dto = new PdDTO();
		dto.setPdName(pdName);
		dto.setPrice(Integer.parseInt(price));
		dto.setNo(Integer.parseInt(no));
		try {
			int cnt = pdService.updatePd(dto);
			
		}catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		//3.결과 저장할게 없으므로 스킵
		//4.보내기
		return "/pd/pdDetail.do?no="+no;
	}

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}
	

}
