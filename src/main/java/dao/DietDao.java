package dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


import vo.Diet;


@Component("ddao")
public class DietDao 
{
	@Autowired
	SqlSessionTemplate mysql;
	private final String NAMESPACE = "mapDiet.";
	
	public DietDao() { }

	public List<Diet> BreakfastList(String id, String inputdate, String breakfast) 
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("inputdate", inputdate);
		map.put("breakfast", breakfast);
		return this.mysql.selectList(NAMESPACE + "Breakfast", map);
	}

	public List<Diet> lunchList(String id, String inputdate, String lunch) 
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("inputdate", inputdate);
		map.put("lunch", lunch);
		return this.mysql.selectList(NAMESPACE + "lunch", map);
	}

	public List<Diet> dinnerList(String id, String inputdate, String dinner) 
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("inputdate", inputdate);
		map.put("dinner", dinner);
		return this.mysql.selectList(NAMESPACE + "dinnerList", map);
	}

	
	public int updateDiet(String foodname, int calorie, int diet_id)
	{
		Diet diet = new Diet();
		diet.setCalorie(calorie);
		diet.setFoodname(foodname);
		diet.setDiet_id(diet_id);

		
		return this.mysql.update(NAMESPACE + "updateDiet", diet);
	}

	public int deleteDiet(int diet_id) 
	{
		Diet diet = new Diet();
		diet.setDiet_id(diet_id);
		
		return this.mysql.delete(NAMESPACE + "deleteDiet", diet_id);
	}

	public int insertDiet(String mem_id, String inputdate, String mealtime, String foodname, int calorie) {
		Diet diet = new Diet();
		diet.setMem_id(mem_id);
		diet.setInputdate(inputdate);
		diet.setMealtime(mealtime);
		diet.setFoodname(foodname);
		diet.setCalorie(calorie);
		return this.mysql.insert(NAMESPACE + "insertDiet", diet);
	}

	public List<Diet> getCal(String id) {
		return this.mysql.selectList(NAMESPACE+"getCal", id);
		
	}
	
	
	
	
	
	
	
}