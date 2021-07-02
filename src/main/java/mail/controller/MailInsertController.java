package mail.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.MailDao;


@Controller
public class MailInsertController 
{
	
	private ModelAndView mav = null ;
	
	@Autowired
	@Qualifier("mldao")
	MailDao mldao;



	public MailInsertController() {
		this.mav = new ModelAndView();
	}
	
	
	
	@GetMapping("/mailinsert.ml")
	private ModelAndView  doGet(@RequestParam(value = "id", required = false) String id,
			HttpSession session)
	{
		
		this.mav.setViewName("mailInsertForm");
		
		return this.mav;
	}
	
	
	@PostMapping("/mailinsert.ml")
	private ModelAndView  doPost(HttpServletRequest request,
			HttpSession session)
	{
		String subject = request.getParameter("subject");
		String receiveid = request.getParameter("receiveid");
		String context = request.getParameter("context");
		
		
		
		this.mav.setViewName("mailList");
		
		return this.mav;
	}
	
	
	
	
	
	
	
	
}
