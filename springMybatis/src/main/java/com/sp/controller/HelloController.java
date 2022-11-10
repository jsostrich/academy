package com.sp.controller;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class HelloController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		//1 파라미터 읽어오기
		
		//2 db작업 - 비즈니스 로직 처리
		String result=getGreeting();
		
		//3 결과, 뷰페이지 저장
		ModelAndView mav = new ModelAndView();
		mav.addObject("greeting", result); //결과 저장
		mav.setViewName("hello"); //뷰페이지
		/*
		 /WEB-INF/views/ + hello + .jsp
		  => /WEB-INF/views/hello.jsp
		*/
		
		return mav;
	}
	
	private String getGreeting() {
		Calendar cal = Calendar.getInstance();
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		String result="";
		if(hour>=6 && hour<=10) {
			result="좋은 아침!";
		}else if(hour>=12 && hour<=15) {
			result="점심식사는 하셨나요?";
		}else if(hour>=18 && hour<=22) {
			result="좋은 밤 되세요";
		}else {
			result="안녕하세요";
		}
		return result;
	}

}
