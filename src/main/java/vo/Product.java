package vo;

import org.springframework.web.multipart.MultipartFile;

public class Product 
{
	private int pr_id;
	private String pr_name;
	private int price;
	private int stock;
	private String inputdate;
	private String category;
	private String context;
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
