package diet.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.DietDao;
import vo.Diet;
import vo.Member;

@Controller
public class MyDietUpdateController {

	private ModelAndView mav = null;

	@Autowired
	@Qualifier("ddao")
	private DietDao ddao;

	@ModelAttribute("diet")
	public Diet mydiet() {
		return new Diet();
	}

	
	// 식단 리스트에서 수정폼으로 갈때
	@GetMapping("/mydietupdate.di")
	private ModelAndView doGet(@RequestParam(value = "foodname", required = true) String foodname,
			@RequestParam(value = "calorie", required = true) String calorie,
			@RequestParam(value = "year", required = true) String year,
			@RequestParam(value = "month", required = true) String month,
			@RequestParam(value = "day", required = true) String day,
			@RequestParam(value = "inputdate", required = true) String inputdate,
			@RequestParam(value="diet_id", required = true) String diet_id)
	{
		mav = new ModelAndView();

		mav.addObject("foodname", foodname);
		mav.addObject("calorie", calorie);
		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("day", day);
		mav.addObject("inputdate",inputdate);
		mav.addObject("diet_id",diet_id);
		
		this.mav.setViewName("myDietUpdate");

		return this.mav;
	}

	
	
	
	// 수정 폼에서 입력한 후
	@PostMapping("/mydietupdate.di")
	private ModelAndView doPost(HttpServletRequest request)
	{
		mav = new ModelAndView();
		String foodname = request.getParameter("foodname");
		int calorie = Integer.parseInt(request.getParameter("calorie")) ;
		String id = request.getParameter("id");
		int diet_id = Integer.parseInt(request.getParameter("diet_id"));
		
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		
		// 잘 넘어오는지 테스트
		System.out.println("변경된 음식명 : " + foodname);
		System.out.println("변경된 칼로리 : " + calorie);
		System.out.println("id : " + id);
		
		
		int bean = ddao.updateDiet(foodname, calorie, diet_id);
		
		
		mav.addObject("id", id);
		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("day", day);
		
		this.mav.setViewName("redirect:/mydietdetail.di");

		return this.mav;
	}
}
