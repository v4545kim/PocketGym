package mail.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.MailDao;
import vo.Mail;
import vo.Member;


@Controller
public class MailDetailController 
{
	
	private ModelAndView mav = null ;
	
	@Autowired
	@Qualifier("mldao")
	private MailDao mldao;

	
	@GetMapping("/maildetail.ml")
	private ModelAndView  doGet(
			@RequestParam(value = "mailnum", required = true) int mailnum,
			@RequestParam(value = "senddetail", required = false) String senddetail,
			HttpSession session)
	{
		mav = new ModelAndView();
		
		Member member = (Member) session.getAttribute("loginfo");
		String id = member.getId();
		int valid = 0;
		
		// 해당 메일의 상세정보들을 불러온다
		Mail bean = mldao.selectByNum(mailnum);
		
		
		// 메일 상세보기후 읽었다는 표시
		int cnt = -99999;
		cnt = mldao.readComplete(mailnum);
		
		//보낸메일함 받은메일함 구분을 위한 valid
		if(bean.getSendid().equals(id))
		{
			valid = 1;
		}
		
		this.mav.addObject("valid", valid);
		this.mav.addObject("bean", bean);
		this.mav.setViewName("mailDetail");
		
		return this.mav;
	}
	
	
}
