package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BoardDao;

@Controller
public class BoardReadHitInsertController {
	
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	@GetMapping("/readhitinsert.br")
	private String  doPost(Model model,
			@RequestParam(value = "bo_id", required = true) int bo_id,
			@RequestParam(value = "mem_id",required = true) String mem_id,
			@RequestParam(value = "bomem_id",required = true) String bomem_id
			){
		if(mem_id.equals(bomem_id)) {
			model.addAttribute("bo_id", bo_id);
			model.addAttribute("mem_id",mem_id);
			return "redirect:/brdetail.br";
		}else {
			int cnt = -99999;
			cnt = dao.insertReadHit(bo_id, mem_id);
			model.addAttribute("bo_id", bo_id);
			model.addAttribute("mem_id",mem_id);
			return "redirect:/brdetail.br";
			
		}
		
	}
}
