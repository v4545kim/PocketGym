package vo;

import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Product 
{
	private int pr_id;
	
	@Length(min=3, max=20, message="상품명은 3글자 이상 20글자 이하이어야 합니다.")
	private String pr_name;
	
	@Min(1)
	private int price;
	
	@Min(1)
	private int stock;
	
	private String inputdate;
	
	@NotEmpty(message="카테고리는 필수 선택 사항입니다.")
	private String category;
	
	@Length(min = 10, max = 100, message = "상품설명은 10글자 이상 100글자 이하이어야 합니다.")
	private String context;
	
	@NotEmpty(message= "첨부 이미지를 넣어주세요.")
	private String image;
	
	private MultipartFile abcd;
	
	
	public MultipartFile getAbcd() {
		return abcd;
	}
	public void setAbcd(MultipartFile abcd) {
		this.abcd = abcd;
		
		if(this.abcd != null) {
			this.image = this.abcd.getOriginalFilename();
		}
	}
	
	public int getPr_id() {
		return pr_id;
	}
	public void setPr_id(int pr_id) {
		this.pr_id = pr_id;
	}
	public String getPr_name() {
		return pr_name;
	}
	public void setPr_name(String pr_name) {
		this.pr_name = pr_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	@Override
	public String toString() {
		return "Product [pr_id=" + pr_id + ", pr_name=" + pr_name + ", price=" + price + ", stock=" + stock
				+ ", inputdate=" + inputdate + ", category=" + category + ", context=" + context + ", image=" + image
				+ "]";
	}
	
	
	
	
}
