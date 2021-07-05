package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vo.Member;
import vo.MyWeight;
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

	public int SelectTotalCount() {
		return this.abcd.selectOne(NAMESPACE + "SelectTotalCount") ; 
	}

	public List<Member> SelectDataList(int offset, int limit) 
	{
		// RowBounds 객체를 사용한 페이징처리
		RowBounds rbs = new RowBounds(offset, limit);
				
		return this.abcd.selectList(NAMESPACE + "SelectDataList", null, rbs);
	}

	public int giveRoutine(int ro_id, String id) 
	{
		System.out.println("여긴 들어오나요");
		Member member = new Member();
		member.setId(id);
		member.setRo_id(ro_id);
		
		return this.abcd.update(NAMESPACE + "giveRoutine", member);
	}

	public int deleteMember(String id) 
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		return this.abcd.delete(NAMESPACE + "DeleteMember", map);
	}
	
	//나의 몸무게 성취율 리스트
	public List<MyWeight> SelectMyWeightList(String id) 
	{
		return this.abcd.selectList(NAMESPACE + "SelectMyWeightList", id);
	}
	
	public int insertMyWeight(MyWeight myweight) {
		return this.abcd.insert(NAMESPACE + "insertMyWeight", myweight);
	}
	

}
