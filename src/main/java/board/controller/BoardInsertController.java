package board.controller;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import vo.Board;
import dao.BoardDao;

@Controller
public class BoardInsertController {
	ModelAndView mav = null;
	
	@ModelAttribute("board")
	public Board board() {
		return new Board();
	}
	
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	public BoardInsertController() {
		this.mav = new ModelAndView();
	}
	
	@GetMapping("/brinsert.br")
	private ModelAndView doGet(){
		this.mav.setViewName("boardInsertForm");
		return this.mav;
	}
	
	@PostMapping("/brinsert.br")
	private ModelAndView  doPost(
			@ModelAttribute("board") @Valid Board bean,
			BindingResult asdf,
			HttpServletRequest request){
		
		if (asdf.hasErrors()) {
			System.out.println("유효성 검사에 문제 있슴");
			System.out.println(asdf);
			mav.addObject("bean", bean);
			mav.setViewName("boardInsertForm");
		} else {
			System.out.println("유효성 검사에 문제 없슴");
			MultipartFile multi1 = bean.getAbcd1() ;
			MultipartFile multi2 = bean.getAbcd2() ;
			String uploadPath = "/upload" ;
			
			String realPath = request.getRealPath(uploadPath) ;
			System.out.println(realPath);
			
			try {
				File destination1 = utility.Utility.getUploadedFileInfo(multi1, realPath);
				File destination2 = utility.Utility.getUploadedFileInfo(multi2, realPath);
				
				multi1.transferTo(destination1);
				multi2.transferTo(destination2);
				
				
				bean.setBe_image(destination1.getName());
				bean.setAf_image(destination2.getName());
				this.dao.insertBoard(bean);
				mav.setViewName("redirect:/brlist.br");
			} catch (Exception e) {				
				e.printStackTrace();
				//이쪽부분 재수정 필요
				System.out.println("예외처리확인");
				mav.setViewName("redirect:/brlist.br");
			}
		}			
		return this.mav;
	}
}
