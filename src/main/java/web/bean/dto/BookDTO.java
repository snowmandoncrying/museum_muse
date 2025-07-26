package web.bean.dto;
import java.sql.Timestamp;

public class BookDTO {
	private int reservationId;
    private String exhibitName;
    private Timestamp visitDate;
    private String visitTime;
    private String userId;
    private String userName;
    private String userPhone;
    private int visitQuantity;
    private int reservationAmount;
    private String paymentMethod;
    private Timestamp reservationDate;
    
	public int getReservationId() {
		return reservationId;
	}
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	public String getExhibitName() {
		return exhibitName;
	}
	public void setExhibitName(String exhibitName) {
		this.exhibitName = exhibitName;
	}
	public Timestamp getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(Timestamp visitDate) {
		this.visitDate = visitDate;
	}
	public String getVisitTime() {
		return visitTime;
	}
	public void setVisitTime(String visitTime) {
		this.visitTime = visitTime;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public int getVisitQuantity() {
		return visitQuantity;
	}
	public void setVisitQuantity(int visitQuantity) {
		this.visitQuantity = visitQuantity;
	}
	public int getReservationAmount() {
		return reservationAmount;
	}
	public void setReservationAmount(int reservationAmount) {
		this.reservationAmount = reservationAmount;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public Timestamp getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(Timestamp reservationDate) {
		this.reservationDate = reservationDate;
	}
    
    
    
}
    