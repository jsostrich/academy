package pack.spring.basic;

import java.util.List;
import java.util.Map;

public interface MemberService {
	
	// ȸ�� ���� Service
	String create(Map<String, Object> map);
	
	// ȸ�� �󼼺��� Service
	Map<String, Object> detail(Map<String, Object> map);
	
	// ȸ�� ���� ����Ʈ ���� Service
	List<Map<String, Object>> list(Map<String, Object> map);
	
	//����ȭ��
	String index();
}
