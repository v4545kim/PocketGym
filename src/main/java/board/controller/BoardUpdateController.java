package board.controller;

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

import dao.BoardDao;
import vo.Board;

@Controller
public class BoardUpdateController {
	
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	@GetMapping("/brupdate.br")
	private String  doGet(Model model,
			@RequestParam(value = "bo_id", required = true) int bo_id){
		
		Board bean = dao.selectById(bo_id);
		model.addAttribute("bean", bean);
		
		return "boardUpdateForm";
	}
	
	@PostMapping("/brupdate.br")
	private String  doPost(Model model,
			@ModelAttribute("board") @Valid Board bean,
			BindingResult asdf
			){
		if(asdf.hasErrors()) {
			System.out.println("게시글 수정 유효성 검사에 문제 있슴");
			System.out.println( asdf );
			model.addAttribute("bean", bean);
			return "boardUpdateForm";
		}else {
			System.out.println("게시글 수정 유효성 검사에 문제 없슴");
			int cnt = -999999 ;
			cnt = dao.updateBoard(bean);
			model.addAttribute("bo_id", bean.getBo_id());
			
			return "redirect:/brdetail.br";
		}
		
	}
}
