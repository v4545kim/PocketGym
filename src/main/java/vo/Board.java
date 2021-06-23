package vo;

public class Board 
{
	private int bo_id;
	private String mem_id;
	private String title;
	private String context;
	private String be_image;
	private String af_image;
	private String regdate;
	
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getBe_image() {
		return be_image;
	}
	public void setBe_image(String be_image) {
		this.be_image = be_image;
	}
	public String getAf_image() {
		return af_image;
	}
	public void setAf_image(String af_image) {
		this.af_image = af_image;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "Board [bo_id=" + bo_id + ", mem_id=" + mem_id + ", title=" + title + ", context=" + context
				+ ", be_image=" + be_image + ", af_image=" + af_image + ", regdate=" + regdate + "]";
	}
	
}
