package routine.controller;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import dao.RoutineDao;
import net.sf.json.JSONArray;
import vo.Exercise;
import vo.Member;
import vo.MyRoutineCheck;

@Controller
public class MyRoutineController {
	
	
	@Autowired
	@Qualifier("rdao")
	private RoutineDao rdao;
	
	@RequestMapping(value = {"/myroutine.ro", "/insertroutine.ro"})
	private String  doGet(Model model, HttpSession session, HttpServletRequest request, @RequestParam(value="regdate", required=false) String regdate, @RequestParam(value="ex_id", required = false) String ex_id){
		Member member = (Member) session.getAttribute("loginfo");
		String id = member.getId();
		String requestUrl = request.getServletPath();
		if(requestUrl.equals("/myroutine.ro")) {
			// 내 루틴에 속해 있는 운동들 가져오기
			List<Exercise> lists = rdao.myRoutine(id);
			
			// routinecheck table에 있는 값 가져오기
			List<MyRoutineCheck> lists2 = rdao.myRoutineCheck(id);
			model.addAttribute("lists", lists);
			for(MyRoutineCheck el : lists2) {
				System.out.println(el);
			}
			
			//자바스크립트에 바인딩 할 수 있도록 JSON 처리
			JSONArray jsonArray = new JSONArray();
			System.out.println(jsonArray.fromObject(lists2));
			System.out.println(jsonArray.fromObject(lists2).size());	
			model.addAttribute("lists2", jsonArray.fromObject(lists2));
			//for 문에서 사용하기 위해 lists2의 길이 구해줌
			model.addAttribute("size", jsonArray.fromObject(lists2).size());
			//자바스크립트에서 쓸 수 있도록 contextPath 변수 바인딩
			String contextPath = request.getContextPath();
			model.addAttribute("contextPath",contextPath);
			
			return "myRoutine";
		}else {
			// 완료한 운동 routinecheck table에 값 넣기 
			rdao.routineCheck(id, ex_id, regdate);
			
			// 내 루틴에 속해 있는 운동들 가져오기
			List<Exercise> lists = rdao.myRoutine(id);
			// routinecheck table에 있는 값 가져오기
			List<MyRoutineCheck> lists2 = rdao.myRoutineCheck(id);
			model.addAttribute("lists", lists);
			for(MyRoutineCheck el : lists2) {
				System.out.println(el);
			}
			JSONArray jsonArray = new JSONArray();
			System.out.println(jsonArray.fromObject(lists2));
			System.out.println(jsonArray.fromObject(lists2).size());	
			model.addAttribute("lists2", jsonArray.fromObject(lists2));
			model.addAttribute("size", jsonArray.fromObject(lists2).size());
			String contextPath = request.getContextPath();
			model.addAttribute("contextPath",contextPath);
			return "myRoutine";
		}		
	}
}
