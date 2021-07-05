package member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDao;
import vo.Member;
import vo.MyWeight;

@Controller
public class MemberPlanController
{
	ModelAndView mav = null;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	// mav 새로 객체 생성
	public MemberPlanController() 
	{
		this.mav = new ModelAndView();
	}
	
	
	
	
	@GetMapping("/plan.me")
	private ModelAndView  doGet(HttpSession session,HttpServletRequest request)
	{
		Member member = (Member)session.getAttribute("loginfo");
		String id = member.getId();
		
		
		List<MyWeight> lists = mdao.SelectMyWeightList(id);
		
		// 등록된 몸무게 리스트 개수
		System.out.println("리스트사이즈는 : " + lists.size());
		int size = lists.size();
		
		
		//각 몸무게와 등록날짜 default값 설정
		int weight1 = 0;
    	String regdate1 = "미등록";
    	int weight2 = 0;
    	String regdate2 = "미등록";
    	int weight3 = 0;
    	String regdate3 = "미등록";
    	int weight4 = 0;
    	String regdate4 = "미등록";
    	int weight5 = 0;
    	String regdate5 = "미등록";
    	int weight6 = 0;
    	String regdate6 = "미등록";
    	int weight7 = 0;
    	String regdate7 = "미등록";
		
		
    	
    	
    	if(size >= 7)
    	{
    		weight7 = lists.get(6).getWeight();
        	regdate7 = lists.get(6).getRegdate();
    	}
    	if (size >= 6) 
    	{
    		weight6 = lists.get(5).getWeight();
        	regdate6 = lists.get(5).getRegdate();
		}
    	if (size >= 5) 
    	{
    		weight5 = lists.get(4).getWeight();
        	regdate5 = lists.get(4).getRegdate();
		}
    	if (size >= 4) 
    	{
    		weight4 = lists.get(3).getWeight();
        	regdate4 = lists.get(3).getRegdate();
		}
    	if (size >= 3) 
    	{
    		weight3 = lists.get(2).getWeight();
        	regdate3 = lists.get(2).getRegdate();
		}
    	if (size >= 2) 
    	{
    		weight2 = lists.get(1).getWeight();
        	regdate2 = lists.get(1).getRegdate();
		}
    	if (size >= 1) 
    	{
    		weight1 = lists.get(0).getWeight();
        	regdate1 = lists.get(0).getRegdate();
		}

		
		
		
		
		request.setAttribute("weight1", weight1);
		request.setAttribute("regdate1", regdate1);
		request.setAttribute("weight2", weight2);
		request.setAttribute("regdate2", regdate2);
		request.setAttribute("weight3", weight3);
		request.setAttribute("regdate3", regdate3);
		request.setAttribute("weight4", weight4);
		request.setAttribute("regdate4", regdate4);
		request.setAttribute("weight5", weight5);
		request.setAttribute("regdate5", regdate5);
		request.setAttribute("weight6", weight6);
		request.setAttribute("regdate6", regdate6);
		request.setAttribute("weight7", weight7);
		request.setAttribute("regdate7", regdate7);
		this.mav.addObject("lists", lists);
		this.mav.setViewName("mePlan");
		
		return this.mav;
	}
	
	
	
	
	
	
	
	
	@PostMapping("/plan.me")
	private String  doPost(Model model){
		return "";
	}
}
