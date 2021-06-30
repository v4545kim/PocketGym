package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vo.Exercise;
import vo.MyRoutineCheck;
import vo.Routine;

@Component("rdao")
public class RoutineDao {
	private final String NAMESPACE = "mapRoutine.";
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public List<Exercise> myRoutine(String id) {
		return this.abcd.selectList(NAMESPACE+"myRoutine", id) ;
	}
	
	public int routineCheck(String mem_id, String ex_id, String regdate) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("mem_id", mem_id);
		map.put("ex_id", ex_id);
		map.put("regdate", regdate);
		return this.abcd.insert(NAMESPACE+"routineCheck", map);
	}

	public List<MyRoutineCheck> myRoutineCheck(String id) {		
		return this.abcd.selectList(NAMESPACE+"myRoutineCheck", id);
	}

	public int routineCheckDelete(String id, String regdate, String ex_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("regdate", regdate);
		map.put("ex_id", ex_id);
		return this.abcd.delete(NAMESPACE+"routineCheckDelete", map);
	}

	public List<Routine> selectRoList() {
		return this.abcd.selectList(NAMESPACE+"selectRoList");
	}

	public List<Exercise> routineDetail(String ro_id) {
		return this.abcd.selectList(NAMESPACE+"routineDetail", ro_id);
	}

	public int insertRoutine(Routine routine) {
		return 0;
	}

}
                                                                                                                                                                                           