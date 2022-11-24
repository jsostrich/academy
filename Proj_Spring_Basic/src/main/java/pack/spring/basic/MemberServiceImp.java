package pack.spring.basic;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberDao memberDao;
	
// 회원 가입 시작	
	@Override
	public String create(Map<String, Object> map) {
		
		int affectRowCnt = this.memberDao.insert(map);
		if (affectRowCnt == 1) {
			return map.get("no").toString();
		}
		return null;
	}
//회원 가입 끝

// 회원 상세정보 시작//
	@Override
	public Map<String, Object> detail(Map<String, Object> map) {
		return this.memberDao.selectDetail(map);
	}
// 회원 상세 정보 끝 //
}
