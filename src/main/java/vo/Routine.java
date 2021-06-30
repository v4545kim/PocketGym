package vo;

import java.util.List;

public class Routine 
{
	private int ro_id;
	private String ro_name;
	private String ro_context;
	private List<String> ex_id;
	
	
	public int getRo_id() {
		return ro_id;
	}
	public void setRo_id(int ro_id) {
		this.ro_id = ro_id;
	}
	public String getRo_name() {
		return ro_name;
	}
	public void setRo_name(String ro_name) {
		this.ro_name = ro_name;
	}
	public String getRo_context() {
		return ro_context;
	}
	public void setRo_context(String ru_context) {
		this.ro_context = ru_context;
	}
	
	
	public List<String> getEx_id() {
		return ex_id;
	}
	public void setEx_id(List<String> ex_id) {
		this.ex_id = ex_id;
	}
	@Override
	public String toString() {
		return "Routine [ro_id=" + ro_id + ", ro_name=" + ro_name + ", ro_context=" + ro_context + ", ex_id=" + ex_id
				+ "]";
	}
	
}
