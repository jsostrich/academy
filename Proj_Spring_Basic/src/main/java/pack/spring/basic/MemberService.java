package pack.spring.basic;

import java.util.List;
import java.util.Map;

public interface MemberService {
	
	// 회원 가입 Service
	String create(Map<String, Object> map);
	
	// 회원 상세보기 Service
	Map<String, Object> detail(Map<String, Object> map);
	
	// 회원 정보 리스트 보기 Service
	List<Map<String, Object>> list(Map<String, Object> map);
	
	//메인화면
	String index();
}
