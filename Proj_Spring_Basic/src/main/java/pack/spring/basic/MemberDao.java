package pack.spring.basic;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//회원 가입
	public int insert(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("member.insert",map);
	}
	
	//회원 상세 정보 보기
	public Map<String, Object> selectDetail(Map<String, Object> map){
		return this.sqlSessionTemplate.selectOne("member.select_detail", map);
	}
	
	//회원 리스트 보기
	public List<Map<String, Object>> selectList(Map<String, Object> map){
		return this.sqlSessionTemplate.selectList("member.select_list",map);
	}
}
