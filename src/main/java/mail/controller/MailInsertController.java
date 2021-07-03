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
			@RequestParam(value = "sendid", required = false) String sendid,
			HttpSession session)
	{
		
		// 답장하기시 보낸 사람을 답장 받을 사람으로 넘긴다.
		String replyreceiveid = sendid;
		
		
		System.out.println("답장받을 사람은 : " + replyreceiveid);
		this.mav.addObject("replyreceiveid", replyreceiveid);
		this.mav.setViewName("mailInsertForm");
		
		return this.mav;
	}
	
	
	@PostMapping("/mailinsert.ml")
	private ModelAndView  doPost(HttpServletRequest request,
			HttpSession session)
	{
		String id = request.getParameter("id");
		String subject = request.getParameter("subject");
		String receiveid = request.getParameter("receiveid");
		String context = request.getParameter("context");
		
		int cnt = -99999;
		
		cnt = mldao.sendmail(id, receiveid, subject, context);
		
		
		System.out.println(cnt);
		
		
		
		
		
		
		this.mav.addObject("id", id);
		this.mav.setViewName("redirect:/maillist.ml");
		
		return this.mav;
	}
	
	
	
	
	
	
	
	
}
