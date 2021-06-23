package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vo.Member;

@Component("mdao")
public class MemberDao {
private final String NAMESPACE = "mapMember." ;	
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public MemberDao() { }	
	
	//아이디와 비번을 사용하여 해당 회원이 존재하나요?
	public Member selectData(String id, String password) {
		Map<String, String> map = new HashMap<String, String>() ;
		map.put("id", id) ;
		map.put("password", password) ;
		//selectData는 sql문장을 찾고있으므로 mapmember.xml로간다
		return this.abcd.selectOne(NAMESPACE + "selectData", map);
	}	
}
