package diet.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.DietDao;

@Controller
public class MyDietInsertController {
	
	
	private ModelAndView mav = null ;
	
	@Autowired
	@Qualifier("ddao")
	private DietDao ddao;
	
	
	
	// mav 새로 객체 생성
	public MyDietInsertController() {
		this.mav = new ModelAndView();
	}
	
	
	
	
	
	
	
	@GetMapping("/mydietinsert.di")
	private ModelAndView  doGet(
			@RequestParam(value = "mealtime", required = true) String mealtime,
			@RequestParam(value = "day", required = true) String day,
			@RequestParam(value = "month", required = true) String month,
			@RequestParam(value = "year", required = true) String year
			)
	{
		
		
		mav.addObject("mealtime", mealtime);
		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("day", day);
		
		this.mav.setViewName("myDietInsert");

		return this.mav;
	}
	
	
	
	
	
	@PostMapping("/mydietinsert.di")
	private ModelAndView  doPost(
			HttpServletRequest request,
			@RequestParam(value = "id", required = true) String mem_id,
			@RequestParam(value = "day", required = true) String day,
			@RequestParam(value = "month", required = true) String month,
			@RequestParam(value = "year", required = true) String year
			)
	{
		String inputdate = year + "/" + month + "/" + day;
		String foodname = request.getParameter("foodname");
		int calorie = Integer.parseInt(request.getParameter("calorie")); 
		String mealtime = request.getParameter("mealtime");
				
		
		int bean = -9999;
		bean = ddao.insertDiet(mem_id, inputdate, mealtime, foodname, calorie);
		
		
		System.out.println("여기는 인설트 컨트롤러(POST)");
		System.out.println("foodname : " + foodname);
		System.out.println("calorie : " + calorie);
		
		mav.addObject("id", mem_id);
		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("day", day);
		
		this.mav.setViewName("redirect:/mydietdetail.di");
		return this.mav;
	}
}
