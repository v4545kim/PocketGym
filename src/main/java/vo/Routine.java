package vo;

public class Routine 
{
	private int ro_id;
	private String ro_name;
	private String ru_context;
	
	
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
	public String getRu_context() {
		return ru_context;
	}
	public void setRu_context(String ru_context) {
		this.ru_context = ru_context;
	}
	
	
	@Override
	public String toString() {
		return "Routine [ro_id=" + ro_id + ", ro_name=" + ro_name + ", ru_context=" + ru_context + "]";
	}
	
}
