package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vo.Mail;

@Component("mldao")
public class MailDao 
{
	@Autowired
	SqlSessionTemplate mailsql;
	private final String NAMESPACE = "mapMail.";
	

	public List<Mail> MyReceiveMailList(String id) 
	{
		
		return this.mailsql.selectList(NAMESPACE + "receiveMailList", id);
	}


	public Mail selectByNum(int mailnum) 
	{
		return this.mailsql.selectOne(NAMESPACE + "selectByNum", mailnum);
	}
	
	
}
