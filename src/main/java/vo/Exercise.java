package vo;

import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;

public class Exercise 
{
	private final String MUST_INPUT = "필수 입력 사항입니다.";
	
	private int ex_id;
	
	@NotEmpty(message="운동이름은 " + MUST_INPUT)
	private String ex_name;
	
	@Min(value=1, message="칼로리는 " + MUST_INPUT)
	private int ex_calorie;
	
	@NotEmpty(message="운동설명은 " + MUST_INPUT)
	private String context;
	
	@NotEmpty(message="운동영상은 " + MUST_INPUT)
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

	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	@Override
	public String toString() {
		return "Exercise [ex_id=" + ex_id + ", ex_name=" + ex_name + ", ex_calorie=" + ex_calorie + ", context="
				+ context + ", url=" + url + "]";
	}

}
