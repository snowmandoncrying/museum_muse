package web.bean.dto;
import java.sql.Timestamp;
public class NoticeDTO {
	private int notices_num;
	private String title;
	private String content;
	private String author;
	private Timestamp created_at;
	private Timestamp updated_at;
	
	
	public int getNotices_num() {	return notices_num;	}
	public void setNotices_num(int notice_num) {		this.notices_num = notice_num;	}
	public String getTitle() {		return title;	}
	public void setTitle(String title) {		this.title = title;	}
	public String getContent() {		return content;	}
	public void setContent(String content) {		this.content = content;	}
	public String getAuthor() {		return author;	}
	public void setAuthor(String author) {		this.author = author;	}
	public Timestamp getCreated_at() {		return created_at;	}
	public void setCreated_at(Timestamp created_at) {		this.created_at = created_at;	}	
	public Timestamp getUpdated_at() {return updated_at;}
	public void setUpdated_at(Timestamp updated_at) {this.updated_at = updated_at;}
}