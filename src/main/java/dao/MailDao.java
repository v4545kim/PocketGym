package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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
	
	
	// 받은 메일함 리스트
	public List<Mail> MyReceiveMailList(String id, int offset, int limit) 
	{
		// RowBounds 객체를 사용한 페이징처리
		RowBounds rbs = new RowBounds(offset, limit);
		
		return this.mailsql.selectList(NAMESPACE + "receiveMailList", id, rbs);
	}
	
	
	// 보낸 메일함 리스트
	public List<Mail> MySendMailList(String id, int offset, int limit) 
	{
		// RowBounds 객체를 사용한 페이징처리
		RowBounds rbs = new RowBounds(offset, limit);
		
		return this.mailsql.selectList(NAMESPACE + "sendMailList", id, rbs);
	}
	
	
	


	public Mail selectByNum(int mailnum) 
	{
		return this.mailsql.selectOne(NAMESPACE + "selectByNum", mailnum);
	}


	public int sendmail(String id, String receiveid, String subject, String context) 
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("sendid", id);
		map.put("receiveid", receiveid);
		map.put("subject", subject);
		map.put("context", context);
		
		return this.mailsql.insert(NAMESPACE + "sendMail", map);
	}


	public int readComplete(int mailnum) 
	{
		return this.mailsql.update(NAMESPACE + "updateReadComplete", mailnum);
	}


	public int SendTotalCount(String id) 
	{
		return this.mailsql.selectOne(NAMESPACE + "SendTotalCount", id) ; 
	}

	public int ReceiveTotalCount(String id) 
	{
		return this.mailsql.selectOne(NAMESPACE + "ReceiveTotalCount", id) ; 
	}
	
	
}
