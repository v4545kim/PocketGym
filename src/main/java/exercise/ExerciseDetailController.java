package exercise;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ExerciseDetailController {
	
	@GetMapping("detail.ex/get")
	private String  doGet(Model model){
		return "";
	}
	
	@PostMapping("detail.ex/post")
	private String  doPost(Model model){
		return "";
	}
}
