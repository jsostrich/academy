package com.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Properties props;
	
	@Override
	//해당 서블릿이 요청될때 최초로 한번만 호출되는 메서드
	public void init(ServletConfig config) {
		//매핑 파일을 읽어서 Properties 컬렉션에 저장한다.
		
		//web.xml에서 init-param의 값 읽어오기
		String configfile2 = config.getInitParameter("configFile2");
		//-> /config/CommandPro2.properties
		
		
		//매핑 파일의 설제 경로 구하기
		String realconfingfile2=
				config.getServletContext().getRealPath(configfile2);
		System.out.println("들어온 파일 : "+configfile2);
		System.out.println("들어온 파일의 실제 경로 : "+realconfingfile2);
		
		//=> //CommandPro.properties 파일의 정보를 Properties 컬렉션에 전달
		props = new Properties();
		FileInputStream fis = null;
		
			try {
				fis = new FileInputStream(realconfingfile2);
				props.load(fis);
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
	//사용자의 요청이 들어올때마다 호출됨
	private void requestPro(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		/*
		 매핑 파일을 참고해서 직원 구해서 일을 시킨다 => 매핑파일 일거리
		 
		 [1] 매핑 파일(Properties 컬렉션)에서 사용자의 URI에 해당하는 직원(담당 Controller)을
		 	구해서, 직원에게 일을 시킨다(담당 Controller의 메서드 호출)
		 	
		 [2] 직원으로부터 결과를 리턴받아서 해당 뷰페이지로 포워드 한다.
		 */
		
		//일단 인코딩 먼저 하기 두개
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		//사용자의 URI 읽어오기 -> /mymvc/tips/book.do
		String uri = request.getRequestURI();
		System.out.println("컨페스트 uri ="+uri);
		//위에서 구한 uri에서 컨테스트를 빼기 그러니까 컨테스트도 구해야함
		String context = request.getContextPath();
		
		String jinjja_uri="";
		if(uri.indexOf(context)!=-1) {
			jinjja_uri=uri.substring(context.length());
		}
		System.out.println("진짜 uri = "+jinjja_uri);
		//진짜 uri를 만들었으니 uri 이름으로 들어갔을때 나오는 클래스의 위치를 찾아야한다
		String command = props.getProperty(jinjja_uri);
		
		//해당 String을 Class로 만든다.
		try {
			Class commandclass = Class.forName(command);
			//여기서 나오는 클래스의 위치를 찾아서 클래스를 만들었으니 그에 맞는 메서드를 찾는다 
			// 아마 이때가 직원들 분류해서 호출할때 쓰는듯
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
			//=> 해당 클래스의 객체를 생성
			
			//담당자 메서드 호출
			
				
				//해당 페이지로 redirect
	
				//=>/mymvc + /tip/bookForm.jsp";
				//=>/mymvc/tip/bookForm.jsp";
	
				//뷰페이지로 포워드
	
	}
}

