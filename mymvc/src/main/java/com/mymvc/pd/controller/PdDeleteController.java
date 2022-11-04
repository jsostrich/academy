package com.mymvc.pd.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.mymvc.pd.model.PdDTO;
import com.mymvc.pd.model.PdService;

public class PdDeleteController implements Controller {

	@Override
	public String requestProcess(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		/*
		  [7]삭제 - delete
		  
		  /pd/pdDelete.do => DispatchServlet =>PdDeleteController => 
		   => 1)pdList.do 로 redirect 또는 
		   	  2)메시지를 보여주는 경우 message.jsp로 포워드
		 */
		
		String no = request.getParameter("no");
		
		PdService service = new PdService();
		String msg="", url="";
		try {
			int cnt = service.deletePd(Integer.parseInt(no));
			if(cnt>0) {
				msg="상품 삭제 성공";
				url="/pd/pdList.do";
			}
		}catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		//3
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		//4
		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {

		return false;
	}

}
