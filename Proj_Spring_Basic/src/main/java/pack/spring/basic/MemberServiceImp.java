package pack.spring.basic;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Override
	public String create(Map<String, Object> map) {
		
		int affectRowCnt = this.memberDao.insert(map);
		if (affectRowCnt == 1) {
			return map.get("no").toString();
		}
		return null;
	}

}
