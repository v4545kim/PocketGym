package vo;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

public class Member 
{
	private final String MUST_INPUT = "필수 입력 사항입니다.";
	
	@NotEmpty(message="아이디는 " + MUST_INPUT)
	@Length(min = 4, max = 20, message = "아이디는 최소 4자리 최대 20자리 입니다.")
	private String id;
	
	@NotEmpty(message="비밀번호는 " + MUST_INPUT)
	@Length(min = 8, max = 40, message = "비밀번호는 최소 8자리 최대 40자리 입니다.")
	private String password;
	
	@NotEmpty(message="이름은 " + MUST_INPUT)
	private String name;
	
	@NotEmpty(message="닉네임은 " + MUST_INPUT)
	@Length(min = 2, max = 10, message = "닉네임은 최소 2자리 최대 10자리 입니다.")
	private String nickname;
	
	@NotEmpty(message="이메일은 " + MUST_INPUT)
	@Email
	private String email;
	
	@NotEmpty(message="주소는 " + MUST_INPUT)
	private String address;
	
	@NotEmpty(message="성별은 " + MUST_INPUT)
	private String gender;
	
	@Pattern(regexp = "\\d{4}[-/]\\d{2}[-/]\\d{2}", message = "생일은 yyyy/MM/dd 또는 yyyy-MM-dd 형식으로 입력해 주세요.")
	private String birth;
	
	@NotNull(message="키는 " + MUST_INPUT)
	@Range(min = 1, max = 300, message = "키는 300cm 이하로 입력하세요.")
	private int height;
	
	@NotNull(message="목표 체중은 " + MUST_INPUT)
	@Range(min = 1, max = 999, message = "몸무게는 1000kg 이하로 입력하세요.")
	private int aim_weight;
	
	@NotNull(message="운동 경력은 " + MUST_INPUT)
	@Max(10)
	@Min(0)
	private int career;
	
	@NotNull(message="목표 기간은 " + MUST_INPUT)
	@Max(52)
	@Min(0)
	private int period;
	
	private int point;
	private int ro_id;
	private String ro_name;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getAim_weight() {
		return aim_weight;
	}
	public void setAim_weight(int aim_weight) {
		this.aim_weight = aim_weight;
	}
	public int getCareer() {
		return career;
	}
	public void setCareer(int career) {
		this.career = career;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
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
	
	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", name=" + name + ", nickname=" + nickname + ", email="
				+ email + ", address=" + address + ", gender=" + gender + ", birth=" + birth + ", height=" + height
				+ ", aim_weight=" + aim_weight + ", career=" + career + ", period=" + period + ", point=" + point
				+ ", ro_id=" + ro_id + ", ro_name=" + ro_name + "]";
	}
	
	
	
}