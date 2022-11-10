package sprindi;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class Main {

	public static void main(String[] args) {
		ArticleService service1 = new ArticleServiceImpl1();
		ArticleVO vo = new ArticleVO();
		vo.setNo(1);
		vo.setTitle("[1] 기존 방식 이용!");
		service1.write(vo);
		
		//2. 생성자를 이용한 종속개체 주입 - ServletImpl2 객체 얻어오기
		//스프링 설정파일에서 해당 빈 객체를 얻어온다
		//1)스프링 컨텍스트 로드
		ApplicationContext context =
		new ClassPathXmlApplicationContext("applicationContext.xml");
		
		//2) 빈(ArticleServiceImpl2) 얻어오기
		ArticleService service2 = 
				(ArticleService)context.getBean("articleService2");
		
		//3) 빈 사용하기
		ArticleVO vo2 = new ArticleVO();
		vo2.setNo(2);
		vo2.setTitle("[2] 생성자를 이용한 종속객체 주입!");
		
		service2.write(vo2);
		
		//
		/*
		Resource resource = 
				new ClassPathResource("applicationContext.xml");
		BeanFactory factory = new XmlBeanFactory(resource);
		
		service2=(ArticleService) factory.getBean("articleService2");
		
		service2.write(vo2);
		*/
		
		//3. setter를 이용한 종속 객체 주입
		ArticleService service3 = 
				(ArticleService)context.getBean("articleService3");
		
		ArticleVO vo3 = new ArticleVO();
		vo3.setNo(3);
		vo3.setTitle("[3] setter를 이용한 종속 객체 주입");
		service3.write(vo3);
		
		
		
	}

}
