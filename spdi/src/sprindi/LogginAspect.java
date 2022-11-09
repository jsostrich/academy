package sprindi;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;

public class LogginAspect {
	private Log log = LogFactory.getLog(getClass());
	
	public Object logging(ProceedingJoinPoint joinPoint) throws Throwable {
		log.info("기록시작 : "+joinPoint.toString());
		long start = System.currentTimeMillis();
		
		try {
			Object retValue = joinPoint.proceed();
			
			/*
			 ProceedingJoinPoint 객체는 Aspect 가 적용되는 객체 및 메서드에 대한 정보를
			 담고 있으며 , 이 객체를 통해서 핵심 로직을 실행할 수 있게 됨 proceed() 메서드를
			 사용하여 실체 타켓 메서드를 호출하게 된다
			*/
			return retValue;
		}finally {
			long finish = System.currentTimeMillis();
			long time = finish-start;
			log.info("기록종료");
			log.info(joinPoint.getSignature().getName()+" 메서드 실행시간 : "
					+ time +" 밀리초");
		}
		
		
	}
}
