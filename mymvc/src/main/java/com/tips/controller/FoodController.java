package com.tips.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.controller.Controller;
import com.tips.model.FoodExpert;

public class FoodController implements Controller{

	@Override
	public String requestProcess(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {

		String foodmenu = request.getParameter("foodmenu");
		
		FoodExpert model = new FoodExpert();
		String result  =model.getTip(foodmenu);
		
		request.setAttribute("result", result);
		
		
		return "/tips/menuResult.jsp";
		
	}

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	} 
	
	
	
	
}
