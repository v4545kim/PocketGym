package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vo.Exercise;

@Component("rdao")
public class RoutineDao {
	private final String NAMESPACE = "mapRoutine.";
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public List<Exercise> myRoutine(String id) {
		return this.abcd.selectList(NAMESPACE+"myRoutine", id) ;
	}
}
                                                                                                                                                                                           