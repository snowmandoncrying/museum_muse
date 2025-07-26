package web.bean.dto;
import java.sql.Timestamp;

public class BoardDTO {
	private int exhibit_number;
	private String exhibit_grade;
	private String exhibit_name;
	private String exhibit_time1;
	private String exhibit_time2;
	private String exhibit_time3;
	private String exhibit_time4;
	private String author_name;
	private Timestamp start_date;
	private Timestamp end_date;
	private String exhibit_content;
	private String exhibit_img;
	
	public int getExhibit_number() {	return exhibit_number;	}
	public void setExhibit_number(int exhibit_number) {	this.exhibit_number = exhibit_number;	}
	public String getExhibit_grade() {	return exhibit_grade;	}
	public void setExhibit_grade(String exhibit_grade) {	this.exhibit_grade = exhibit_grade;	}
	public String getExhibit_name() {	return exhibit_name;	}
	public void setExhibit_name(String exhibit_name) {	this.exhibit_name = exhibit_name;	}
	public String getExhibit_time1() {	return exhibit_time1;	}
	public void setExhibit_time1(String exhibit_time1) {	this.exhibit_time1 = exhibit_time1;	}
	public String getExhibit_time2() {	return exhibit_time2;	}
	public void setExhibit_time2(String exhibit_time2) {	this.exhibit_time2 = exhibit_time2;	}
	public String getExhibit_time3() {	return exhibit_time3;	}
	public void setExhibit_time3(String exhibit_time3) {	this.exhibit_time3 = exhibit_time3;	}
	public String getExhibit_time4() {	return exhibit_time4;	}
	public void setExhibit_time4(String exhibit_time4) {	this.exhibit_time4 = exhibit_time4;	}
	public String getAuthor_name() {	return author_name;	}
	public void setAuthor_name(String author_name) {	this.author_name = author_name;	}
	public Timestamp getStart_date() {	return start_date;	}
	public void setStart_date(Timestamp start_date) {	this.start_date = start_date;	}
	public Timestamp getEnd_date() {	return end_date;	}
	public void setEnd_date(Timestamp end_date) {	this.end_date = end_date;	}
	public String getExhibit_content() {	return exhibit_content;	}
	public void setExhibit_content(String exhibit_content) {	this.exhibit_content = exhibit_content;	}
	public String getExhibit_img() {	return exhibit_img;	}
	public void setExhibit_img(String exhibit_img) {	this.exhibit_img = exhibit_img;	}
	
}
