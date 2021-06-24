package member.controller;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDao;
import vo.Member;

@Controller
public class MemberIdcheckController{
	private final String command = "/idcheck.me" ; 
	private ModelAndView mav = null ;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao dao ;
	
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value = "id", required = true) String id){
		
		mav = new ModelAndView();
		
		Member bean = dao.selectByPkId(id) ;
		
		if ( bean != null ) { // 존재하는 경우
			if(bean.getId().equalsIgnoreCase("admin")) { // 관리자인  경우
				mav.addObject("message", "admin은 <font color='red'><b>사용 불가능</b></font>한 아이디입니다.<br><font color='blue'><b>관리자</b></font>를 위한 아이디입니다.") ;
				mav.addObject("isCheck", false) ;
			}else {
				mav.addObject("message", id + "은(는) 이미 <font color='red'><b>사용중</b></font>인 아이디입니다.") ;
				mav.addObject("isCheck", false) ;	
			}
		}else{ // 존재하지 않는 회원
			mav.addObject("message", id + "은(는) <font color='blue'><b>사용 가능</b></font>한 아이디입니다.") ;
			mav.addObject("isCheck", true) ;
		}
		
		this.mav.setViewName("idCheck");
		return this.mav ;
	}
}
