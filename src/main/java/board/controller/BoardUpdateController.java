package board.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.BoardDao;
import vo.Board;

@Controller
public class BoardUpdateController {
	ModelAndView mav = null;
	
	@ModelAttribute("board")
	public Board board() {
		return new Board();
	}
	
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	public BoardUpdateController() {
		this.mav = new ModelAndView();
	}
	
	@GetMapping("/brupdate.br")
	private ModelAndView doGet(
			@RequestParam(value = "bo_id", required = true) int bo_id){
		
		Board bean = dao.selectById(bo_id);
		this.mav.addObject("bean",bean);
		this.mav.setViewName("boardUpdateForm");
		
		return this.mav;
	} 
	
	@PostMapping("/brupdate.br")
	private ModelAndView doPost(
			@ModelAttribute("board") @Valid Board bean,
			BindingResult asdf,
			HttpServletRequest request
			){
		if(asdf.hasErrors()) {
			System.out.println("게시글 수정 유효성 검사에 문제 있슴");
			System.out.println( asdf );
			mav.addObject("bean", bean);
			mav.setViewName("boardUpdateForm");
		}else {
			System.out.println("게시글 수정 유효성 검사에 문제 없슴");
			MultipartFile multi1 = bean.getAbcd1();
			MultipartFile multi2 = bean.getAbcd2();
			String uploadPath = "/upload";
			
			String realPath = request.getRealPath(uploadPath);
			System.out.println(realPath);
			
			try {
				File destination1 = utility.Utility.getUploadedFileInfo(multi1, realPath);
				File destination2 = utility.Utility.getUploadedFileInfo(multi2, realPath);
				
				multi1.transferTo(destination1);
				multi2.transferTo(destination2);
				
				
				bean.setBe_image(destination1.getName());
				bean.setAf_image(destination2.getName());
				this.dao.updateBoard(bean);
				mav.addObject("bo_id",bean.getBo_id());
				mav.addObject("mem_id", bean.getMem_id());
				mav.setViewName("redirect:/brdetail.br");
			} catch (Exception e) {				
				e.printStackTrace();
				mav.setViewName("redirect:/brdetail.br");
			}
		}			
		return this.mav;
		
	}
}
