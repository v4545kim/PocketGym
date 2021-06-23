package vo;

public class Cart 
{
	private int cart_id;
	private int pr_id;
	private String mem_id;
	private int count;
	private int total_price;
	
	
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getPr_id() {
		return pr_id;
	}
	public void setPr_id(int pr_id) {
		this.pr_id = pr_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
	
	@Override
	public String toString() {
		return "Cart [cart_id=" + cart_id + ", pr_id=" + pr_id + ", mem_id=" + mem_id + ", count=" + count
				+ ", total_price=" + total_price + "]";
	}
	
	
}
