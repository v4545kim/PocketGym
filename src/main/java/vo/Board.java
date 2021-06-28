package vo;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Board 
{
	private int bo_id;
	private String mem_id;
	@Length(min=3, max=20, message="제목은 3글자 이상 20글자 이하이어야 합니다.")
	private String title;
	@Length(min=20, max=255, message="내용은 10글자 이상 255글자 이하이어야 합니다.")
	private String context;
	private String regdate;
	@NotEmpty(message= "이미지 이름은 필수 입력사항입니다.")
	private String be_image;
	@NotEmpty(message= "이미지 이름은 필수 입력사항입니다.")
	private String af_image;
	
	private MultipartFile abcd1 ;
	public MultipartFile getAbcd1() {
		return abcd1;
	}
	public void setAbcd1(MultipartFile abcd1) {
		this.abcd1 = abcd1;
		
		if (this.abcd1 != null) {
			this.be_image = this.abcd1.getOriginalFilename();
		}
	}
	
	private MultipartFile abcd2 ;
	public MultipartFile getAbcd2() {
		return abcd2;
	}
	public void setAbcd2(MultipartFile abcd2) {
		this.abcd2 = abcd2;
		
		if (this.abcd2 != null) {
			this.af_image = this.abcd2.getOriginalFilename();
		}
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
