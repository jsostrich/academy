package com.tips.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;

public class TravelFormController2 implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request, 
			HttpServletResponse response) throws Throwable {
		
		 /*
			  /tips/travelForm2.do 
			=>TravelFormController2
  		 	==> travelForm2.jsp
		 */
		
		return "/tips/travelForm2.do";
	}

	@Override
	public boolean isRedirect() {
		
		return false;
	}

}
