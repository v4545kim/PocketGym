package mail.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.MailDao;
import vo.Mail;


@Controller
public class MailListController 
{
	
	private ModelAndView mav = null ;
	
	@Autowired
	@Qualifier("mldao")
	private MailDao mldao;

	
	@GetMapping("/maillist.ml")
	private ModelAndView  doGet(@RequestParam(value = "id", required = true) String id,
			HttpSession session)
	{
		mav = new ModelAndView();
		System.out.println("메일 id : " + id);
		
		List<Mail> lists = mldao.MyReceiveMailList(id);
		
		
		this.mav.addObject("id", id);
		this.mav.addObject("lists", lists);
		this.mav.setViewName("mailList");
		
		return this.mav;
	}
	
	
}
