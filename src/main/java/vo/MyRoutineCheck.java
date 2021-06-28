package vo;

public class MyRoutineCheck 
{
	private String mem_id;
	private String regdate;
	private int ex_id;
	private String ex_name;
	private int ex_calorie;
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
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
	@Override
	public String toString() {
		return "MyRoutineCheck [mem_id=" + mem_id + ", regdate=" + regdate + ", ex_id=" + ex_id + ", ex_name=" + ex_name
				+ ", ex_calorie=" + ex_calorie + "]";
	}	
}
