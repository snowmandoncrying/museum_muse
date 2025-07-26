package web.bean.dto;

import java.sql.Timestamp;

public class FaqDTO {
   private int question_id;   //글번호 <시퀀스로 들어감>
   private String question_text;//제목
   private String answer_text; // 내용
   private Timestamp reg_date; // 등록일
   private String writer; // 작성자
   
   public String getWriter() {
   return writer;
   }
   public void setWriter(String writer) {
   this.writer = writer;
   }  
   public Timestamp getReg_date() {
      return reg_date;
   }
   public void setReg_date(Timestamp reg_date) {
      this.reg_date = reg_date;
   }
   public int getQuestion_id() {
      return question_id;
   }
 
   public void setQuestion_id(int question_id) {
      this.question_id = question_id;
   }
   public String getQuestion_text() {
      return question_text;
   }
   public void setQuestion_text(String question_text) {
      this.question_text = question_text;
   }
   public String getAnswer_text() {
      return answer_text;
   }
   public void setAnswer_text(String answer_text) {
      this.answer_text = answer_text;
   }
}