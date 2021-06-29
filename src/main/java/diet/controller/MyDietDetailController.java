package diet.controller;

import java.util.List;


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
public class MyDietDetailController {
	
	private ModelAndView mav = null ;
	
	
	@Autowired
	@Qualifier("ddao")
	private DietDao ddao;
	
	
	@ModelAttribute("diet")
	public Diet mydiet() 
	{
		return new Diet();
	}
	
	
	@GetMapping("/mydietdetail.di")
	private ModelAndView  doGet(
			@RequestParam(value = "id", required = true) String id,
			@RequestParam(value = "day", required = true) String day,
			@RequestParam(value = "month", required = true) String month,
			@RequestParam(value = "year", required = true) String year)
	{
		mav = new ModelAndView();
		
		String inputdate = year + "/" + month + "/" + day;
//		System.out.println("inputdate : " +  inputdate);
		
		String breakfast = "breakfast";
		String lunch = "lunch";
		String dinner = "dinner";
		
		List<Diet> breakfastlists = ddao.BreakfastList(id, inputdate, breakfast);
		List<Diet> lunchlists = ddao.lunchList(id, inputdate, lunch);
		List<Diet> dinnerlists = ddao.dinnerList(id, inputdate, dinner);
		
		
		
		
		int breakfasttotal = 0;
		int lunchtotal = 0;
		int dinnertotal = 0;
		
		
		
		// 아침, 점심, 저녁 식사 총 칼로리를 구하기
		for(Diet breakfastcalorie : breakfastlists) 
		{ 
			breakfasttotal += breakfastcalorie.getCalorie();
		}
		 
		for(Diet lunchcalorie : lunchlists) 
		{ 
			lunchtotal += lunchcalorie.getCalorie();
		}
		 
		for(Diet dinnercalorie : dinnerlists) 
		{ 
			dinnertotal += dinnercalorie.getCalorie();
		}
		
		
		
		
		// 각 식단 리스트
		this.mav.addObject("breakfastlists", breakfastlists);
		this.mav.addObject("lunchlists", lunchlists);
		this.mav.addObject("dinnerlists", dinnerlists);
		
		
		// 오늘의 날짜값 넘기기
		this.mav.addObject("year", year);
		this.mav.addObject("month", month);
		this.mav.addObject("day", day);
		this.mav.addObject("inputdate",inputdate);
		
		// 각 total 칼로리
		this.mav.addObject("breakfasttotal", breakfasttotal);
		this.mav.addObject("lunchtotal", lunchtotal);
		this.mav.addObject("dinnertotal", dinnertotal);
		
		
		this.mav.setViewName("myDietDetail");
		
		return this.mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	@PostMapping("/mydietdetail.di")
	private String  doPost(Model model){
		return "";
	}
}
