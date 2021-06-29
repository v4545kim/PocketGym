package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vo.Exercise;

@Component("edao")
public class ExerciseDao {
	
private final String NAMESPACE = "mapExercise.";
	
	@Autowired
	SqlSessionTemplate abcd;

	public Exercise exerciseDetail(String ex_id) {	
		return this.abcd.selectOne(NAMESPACE+"exerciseDetail", ex_id);		
	}

	public List<Exercise> selectExList() {		
		return this.abcd.selectList(NAMESPACE+"selectExList");		
	}

	public int insertExercise(Exercise exercise) {
		return this.abcd.insert(NAMESPACE+"insertExercise", exercise);
	}

	public int updateExercise(Exercise exercise) {
		return this.abcd.update(NAMESPACE+"updateExercise", exercise);
	}

	public int deleteExercise(int ex_id) {
		return this.abcd.delete(NAMESPACE+"deleteExercise", ex_id);
	}
}
