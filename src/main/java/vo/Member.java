package vo;

public class Member 
{
	private String id;
	private String password;
	private String name;
	private String nickname;
	private String email;
	private String address;
	private String gender;
	private int height;
	private int aim_weight;
	private int career;
	private int period;
	private int point;
	private int ro_id;
	
	
	
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
	
	
	
	@Override
	public String toString() {
		return "Member [id=" + id + ", password=" + password + ", name=" + name + ", nickname=" + nickname + ", email="
				+ email + ", address=" + address + ", gender=" + gender + ", height=" + height + ", aim_weight="
				+ aim_weight + ", career=" + career + ", period=" + period + ", point=" + point + ", ro_id=" + ro_id
				+ "]";
	}
	
	
}
