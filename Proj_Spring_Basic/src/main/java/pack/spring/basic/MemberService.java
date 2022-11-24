package pack.spring.basic;

import java.util.Map;

public interface MemberService {
	
	String create(Map<String, Object> map);
	
	Map<String, Object> detail(Map<String, Object> map);
}
