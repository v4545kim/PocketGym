package routine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.ExerciseDao;
import dao.RoutineDao;
import vo.Exercise;
import vo.Routine;

@Controller
public class RoutineUpdateController {
	
	@Autowired
	@Qualifier("rdao")
	RoutineDao rdao;
	
	@Autowired
	@Qualifier("edao")
	ExerciseDao edao;
	
	@ModelAttribute("bean")
	public Routine routine() {
		return new Routine();
	}
	
	@ModelAttribute("ex")
	public List<Exercise> ex_list(){
		List<Exercise> list = edao.selectExList();		
		return list;
	}
	
	@GetMapping("/update.ro")
	private String  doGet(Model model, @RequestParam String ro_id){
		//루틴 정보 가져오기
		Routine routine = rdao.selectById(ro_id);
		model.addAttribute("routine",routine);
		
		//루틴에 속한 운동들 아이디 값만 List로 가져오기
		List<String> list = rdao.routineExId(ro_id);
		for (String el : list) {
			System.out.println("루틴 운동 아이디 값: "+ el);
		}
		model.addAttribute("list", list);
		return "roUpdateForm";
	}
	
	@PostMapping("/update.ro")
	private String  doPost(Model model, @ModelAttribute("bean") Routine routine){
		
		//루틴 아이디
		String ro_id = Integer.toString(routine.getRo_id());
		System.out.println(ro_id);
		
		//속해있는 운동들 아이디값
		List<String> list = routine.getEx_id();
		for (String string : list) {
			System.out.println(string);
		}
		
		//수정된 루틴 값 DB에 넣기
		int cnt = rdao.updateRoutine(routine);
		
		//ExandRoutine에서 기존 루틴 운동들 삭제해주기
		rdao.deleteExandroutine(ro_id);
		
		for (String ex_id : list) {
			int cnt2 = rdao.insertExandRoutine(ro_id, ex_id);
		}
		return "redirect:/list.ro";
	}
}
