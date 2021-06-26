package vo;

public class Exercise 
{
	private int ex_id;
	private String ex_name;
	private int ex_calorie;
	private String url;
	
	
	public int getEx_id() {
		return ex_id;
	}
	public void setEx_id(int ex_id) {
		this.ex_id = ex_id;
	}
	public String getEx_name() {
		return ex_name;
	}
	public void setEx_name(String ex_name) {
		this.ex_name = ex_name;
	}
	public int getEx_calorie() {
		return ex_calorie;
	}
	public void setEx_calorie(int ex_calorie) {
		this.ex_calorie = ex_calorie;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String upl) {
		this.url = upl;
	}
	
	
	@Override
	public String toString() {
		return "Exercise [ex_id=" + ex_id + ", ex_name=" + ex_name + ", ex_calorie=" + ex_calorie + ", url=" + url
				+ "]";
	}
	
	
	
	
}
