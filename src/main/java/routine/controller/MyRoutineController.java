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

import dao.DietDao;
import dao.RoutineDao;
import net.sf.json.JSONArray;
import vo.Diet;
import vo.Exercise;
import vo.Member;
import vo.MyRoutineCheck;

@Controller
public class MyRoutineController {
	
	
	@Autowired
	@Qualifier("rdao")
	private RoutineDao rdao;
	
	@Autowired
	@Qualifier("ddao")
	private DietDao ddao;
	
	@RequestMapping(value = {"/myroutine.ro", "/insertroutine.ro"})
	private String  doGet(Model model, HttpSession session, HttpServletRequest request, @RequestParam(value="regdate", required=false) String regdate, @RequestParam(value="ex_id", required = false) String ex_id){
		Member member = (Member) session.getAttribute("loginfo");
		String id = member.getId();
		String requestUrl = request.getServletPath();
		if(requestUrl.equals("/myroutine.ro")) { //myroutine 처음 들어갈 때
			// 내 루틴에 속해 있는 운동들 가져오기
			List<Exercise> lists = rdao.myRoutine(id);
			model.addAttribute("lists", lists);
			
			// routinecheck table에 있는 값 가져오기
			List<MyRoutineCheck> lists2 = rdao.myRoutineCheck(id);
			
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
			
			//식단 테이블에서 섭취한 칼로리 가져오기
			List<Diet> deList = ddao.getCal(id);
			for(Diet el : deList) {
				System.out.println(el);
			}
			model.addAttribute("deList", jsonArray.fromObject(deList));
			model.addAttribute("desize", jsonArray.fromObject(deList).size());
			
			//자바스크립트에서 쓸 수 있도록 contextPath 변수 바인딩
			String contextPath = request.getContextPath();
			model.addAttribute("contextPath",contextPath);
			model.addAttribute("id",id);
			
			return "myRoutine";
		}else { //루틴 완료 눌렀을 때
			//오늘 루틴에서 완료한 운동이 이미 DB에 들어있는지 확인하는 과정
			String mem_id = rdao.findRoutineCheck(id, ex_id, regdate);

				try {					
					Boolean b = mem_id.equals(null);
					
					//mem_id가 null이 아니면 이미 완료한 운동이므로 아래 try문 정상 실행
					
					String message = "이미 완료한 운동입니다";
					model.addAttribute("err",message);
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
					
					//식단 테이블에서 섭취한 칼로리 가져오기
					List<Diet> deList = ddao.getCal(id);
					for(Diet el : deList) {
						System.out.println(el);
					}
					model.addAttribute("deList", jsonArray.fromObject(deList));
					model.addAttribute("desize", jsonArray.fromObject(deList).size());
					
					String contextPath = request.getContextPath();
					model.addAttribute("contextPath",contextPath);
					model.addAttribute("id",id);
					return "myRoutine";
					
					
				} catch (NullPointerException e) {
					//mem_id가 null이라서 nullpointexception 발생하면 처음 완료하는 운동이니까 catch해서 아래 코딩 실행
					
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
					
					//식단 테이블에서 섭취한 칼로리 가져오기
					List<Diet> deList = ddao.getCal(id);
					for(Diet el : deList) {
						System.out.println(el);
					}
					model.addAttribute("deList", jsonArray.fromObject(deList));
					model.addAttribute("desize", jsonArray.fromObject(deList).size());
					
					String contextPath = request.getContextPath();
					model.addAttribute("contextPath",contextPath);
					model.addAttribute("id",id);
					return "myRoutine";
				}
		
		}		
	}
}
