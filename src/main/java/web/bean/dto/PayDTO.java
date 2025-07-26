package web.bean.dto;

public class PayDTO {
	
	private String exhibit_name;
	private String date;
	private String name;
	private int quantity;
	private int amount;
	private String formattedDate;
	private String pay;
	private String time;
	
	
	public String getExhibit_name() {
		return exhibit_name;
	}
	public void setExhibit_name(String exhibit_name) {
		this.exhibit_name = exhibit_name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getFormattedDate() {
		return formattedDate;
	}
	public void setFormattedDate(String formattedDate) {
		this.formattedDate = formattedDate;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
