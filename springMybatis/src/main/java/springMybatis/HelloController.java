package springMybatis;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class HelloController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		//1 요청 파라미터 읽어오기
		
		//2 db작업 - 비즈니스 로직 처리
		
		//3 결과, 뷰페이지 저장
		
		
		return null;
	}

	private String getGreeting() {
		
	}
	
}
