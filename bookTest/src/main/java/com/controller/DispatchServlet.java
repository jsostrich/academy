package com.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/DispatchServlet")
public class DispatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Properties props;
	
	public void init(ServletConfig config) {
		String configfile = config.getInitParameter("configFile");
		//=> /config/CommandPro.properties
		
		String realconfigfile=
				config.getServletContext().getRealPath("configFile");
		System.out.println("configfile = "+configfile);
		System.out.println("realfigfile = "+realconfigfile);
		
		props = new Properties();
		FileInputStream fis = null;
		
		try {
			fis = new FileInputStream(realconfigfile);
			props.load(fis);
			//=> 커맨드 프로포티스 파일을 프로포티 파일 컬렉션에 전달
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		requestPro(request, response);
	}

	private void requestPro(HttpServletRequest request, 
			HttpServletResponse	response) throws UnsupportedEncodingException {
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		System.out.println("uri ="+uri);
		
		String contextPath = request.getContextPath();
		if(uri.indexOf(contextPath)!=-1) {
			uri=uri.substring(contextPath.length());
		}
		System.out.println("명령어만 추출 :"+uri);
		
		String commandStr = props.getProperty(uri);
		System.out.println("명령 배분된 클래스 이름 :"+commandStr);
		
		try {
			Class commandClass = Class.forName(commandStr);
			Controller controller = (Controller)commandClass.newInstance();
			//=> 해당 클래스의 객체 생성
			//담당자 메서드 호출
			String viewPage = controller.requestProcess(request, response);
			System.out.println("viewPage = "+viewPage);
			
			if(controller.isRedirect()) {
				System.out.println("redirect!");
				
				//해당 페이지로 redirect
				response.sendRedirect(contextPath+ viewPage);
				//=>/mymvc + /tip/bookForm.jsp";
				//=>/mymvc/tip/bookForm.jsp";
			}else {
				System.out.println("forward!\n");
				//뷰페이지로 포워드
				RequestDispatcher dispatcher
				=request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
