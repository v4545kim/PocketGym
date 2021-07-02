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
public class MailDetailController 
{
	
	private ModelAndView mav = null ;
	
	@Autowired
	@Qualifier("mldao")
	private MailDao mldao;

	
	@GetMapping("/maildetail.ml")
	private ModelAndView  doGet(@RequestParam(value = "mailnum", required = true) int mailnum,
			HttpSession session)
	{
		mav = new ModelAndView();
		
		System.out.println("메일 넘버 : " + mailnum);
		
		Mail bean = mldao.selectByNum(mailnum);
		
		
		this.mav.addObject("bean", bean);
		this.mav.setViewName("mailDetail");
		
		return this.mav;
	}
	
	
}
