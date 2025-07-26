package web.bean.dto;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;

public class UserDTO {
   
   private String id;
   private String name;
   private String birth;
   private String gender;
   private String email;
   private String phone;
   private String address;
   private String reg;
   private String pw;
   private String grade;
   private String gradeCheck;
   private String newPw;
   private String auto;	// 자동로그인
        
   public String getAuto() {return auto;}
   public void setAuto(String auto) {this.auto = auto;}
   
   public String getNewPw() {return newPw;}
   public void setNewPw(String newPw) {this.newPw = newPw;}
   
   public String getGradeCheck() {
      return gradeCheck;
   }
   public void setGradeCheck(String gradeCheck) {
      if(gradeCheck.equals("admin")) {
         this.grade = "관리자";
      }
   }
   public String getGrade() {return grade;}
   public void setGrade(String grade) {   this.grade = grade; }
   public String getId() {return id;}
   public void setId(String id) {this.id = id;}
   public String getName() {return name;}
   public void setName(String name) {this.name = name;}
   public String getBirth() {return birth;}
   
   public void setBirth(String birth) {
      this.birth = birth.split(" ")[0];               
      System.out.println("UserDTO-birth======"+this.birth);
      LocalDate birthDate = LocalDate.parse(this.birth, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
      int age = calculateAge(birthDate);
      
      if(age >= 18 ) {
         this.grade="성인";
      }else {
         this.grade = "미성년";
      }
      
   }

   private int calculateAge(LocalDate birthDate) {	// 나이 계산 (생년월일과 현재 비교해서 나이를 가져옴) 
      LocalDate now = LocalDate.now();
      Period period = Period.between(birthDate, now);
      return period.getYears();
   }
   
   public String getGender() {return gender;}
   public void setGender(String gender) {this.gender = gender;}
   public String getEmail() {return email;}
   public void setEmail(String email) {this.email = email;}
   public String getPhone() {return phone;}
   public void setPhone(String phone) {this.phone = phone;}
   public String getAddress() {return address;}
   public void setAddress(String address) {this.address = address;}
   public String getReg() {return reg;}
   public void setReg(String reg) {this.reg = reg;}
   public String getPw() {return pw;}
   public void setPw(String pw) {this.pw = pw;}
   
   }