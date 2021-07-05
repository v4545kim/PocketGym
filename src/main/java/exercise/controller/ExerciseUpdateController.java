package exercise.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.ExerciseDao;
import vo.Exercise;

@Controller
public class ExerciseUpdateController {
	
	@Autowired
	@Qualifier("edao")
	ExerciseDao edao;
	
	@ModelAttribute("bean")
	public Exercise exercise() {
		return new Exercise();
	}
	
	@GetMapping("/update.ex")
	private String  doGet(Model model, @RequestParam("ex_id") String ex_id){
		Exercise bean = edao.exerciseDetail(ex_id);
		model.addAttribute("bean", bean);
		return "exUpdateForm";
	}
	
	@PostMapping("/update.ex")
	private String  doPost(Model model, @ModelAttribute("bean") @Valid Exercise exercise, BindingResult asdf, HttpServletRequest request){		
		
		if(asdf.hasErrors()) {
			System.out.println("유효성 검사 실패");
			model.addAttribute("exercise", exercise);
			return "exInsertForm";
		}else {	
			MultipartFile multi = exercise.getMpf();
			String uploadPath = "/upload";

			String realPath = request.getRealPath(uploadPath);
			System.out.println(realPath);
			
			try {
				File destination = utility.Utility.getUploadedFileInfo(multi, realPath);
				multi.transferTo(destination);
				exercise.setEx_image(destination.getName());
				int cnt = edao.updateExercise(exercise);
				int ex_id = exercise.getEx_id();
				return "redirect:/detail.ex?ex_id="+ex_id;
				
			} catch (Exception e) {
				e.printStackTrace();
				return "redirect:/list.ex";
			}			
		}
	}
}
