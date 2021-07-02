package vo;

import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Routine 
{
	private final String MUST_INPUT = "필수 입력 사항입니다." ;	

	
	private int ro_id;
	
	@NotEmpty(message= "루틴이름은 " + MUST_INPUT)
	private String ro_name;
	
	@NotEmpty(message= "루틴내용은 " + MUST_INPUT)
	private String ro_context;
	
	@NotNull(message= "루틴 운동들은 " + MUST_INPUT)
	@Size(min = 1, message = "루틴운동은 1개 이상 등록되어야 합니다")
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
