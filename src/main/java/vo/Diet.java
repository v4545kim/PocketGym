package vo;

public class Diet 
{
	private int diet_id;
	private String mem_id;
	private String mealtime;
	private String foodname;
	private int calorie;
	private String inputdate;
	
	
	public int getDiet_id() {
		return diet_id;
	}
	public void setDiet_id(int diet_id) {
		this.diet_id = diet_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMealtime() {
		return mealtime;
	}
	public void setMealtime(String mealtime) {
		this.mealtime = mealtime;
	}
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	public int getCalorie() {
		return calorie;
	}
	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	
	@Override
	public String toString() {
		return "Diet [diet_id=" + diet_id + ", mem_id=" + mem_id + ", mealtime=" + mealtime + ", foodname=" + foodname
				+ ", calorie=" + calorie + ", inputdate=" + inputdate + "]";
	}
	
}
