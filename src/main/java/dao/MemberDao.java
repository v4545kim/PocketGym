package dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vo.Member;
import vo.Order;

@Component("mdao")
public class MemberDao {
	private final String NAMESPACE = "mapMember.";

	@Autowired
	SqlSessionTemplate abcd;

	public MemberDao() {
	}

	// 아이디와 비번을 사용하여 해당 회원이 존재하나요?
	public Member selectData(String id, String password) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);
		// SelectData는 sql문장을 찾고있으므로 mapmember.xml로간다
		return this.abcd.selectOne(NAMESPACE + "selectData", map);
	};

	public int insertData(Member bean) {
		return abcd.insert(NAMESPACE + "insertData", bean);
	}

	public Member selectById(String id) {
		return this.abcd.selectOne(NAMESPACE + "selectById", id);
	}

	public double selectMyWeight(String id) {
		return Double.parseDouble(String.valueOf(this.abcd.selectOne(NAMESPACE + "selectMyWeight", id))) ;
	}

	public int updateMember(Member bean) {
		return this.abcd.update(NAMESPACE + "updateMember", bean);
	}
	
	public Member selectByPkId(String id) {
	      return this.abcd.selectOne(NAMESPACE + "selectDataID", id);
	}
	
	public Member selectByPkNickname(String id) {
	      return this.abcd.selectOne(NAMESPACE + "selectDataNickname", id);
	}

	public Member selectForOrder(String id) {
		return this.abcd.selectOne(NAMESPACE + "selectForOrder", id);
	}

	public int changePoint(Order order) {
		return this.abcd.update(NAMESPACE + "changePoint", order);
	}
	
	

}
