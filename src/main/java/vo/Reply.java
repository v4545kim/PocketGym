package vo;

public class Reply 
{
	private int re_id;
	private int bo_id;
	private String mem_id;
	private String context;
	private String regdate;
	
	
	public int getRe_id() {
		return re_id;
	}
	public void setRe_id(int re_id) {
		this.re_id = re_id;
	}
	public int getBo_id() {
		return bo_id;
	}
	public void setBo_id(int bo_id) {
		this.bo_id = bo_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "Reply [re_id=" + re_id + ", bo_id=" + bo_id + ", mem_id=" + mem_id + ", context=" + context
				+ ", regdate=" + regdate + "]";
	}
	
	
	
}
