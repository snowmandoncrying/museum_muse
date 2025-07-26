package web.bean.dao;
import java.sql.*;

import java.util.*;
import web.bean.dto.FaqDTO;

public class FaqDAO {

   private Connection conn = null;
   private PreparedStatement pstmt = null;
   private ResultSet rs = null;
   private String sql = null;
   
// FAQ 수정 메서드
   public void updateFaq(FaqDTO faq) {
	   
	   try {
		   conn = OracleConnection.getConnection();
		   sql="update admin_faq set question_text=?, answer_text=? where question_id=?";
		   pstmt = conn.prepareStatement(sql);
		   pstmt.setString(1, faq.getQuestion_text());
		   pstmt.setString(2, faq.getAnswer_text());
		   pstmt.setInt(3, faq.getQuestion_id());
		   pstmt.executeUpdate();
	   }catch(Exception e) {
		   e.printStackTrace();
	   }finally {
		   OracleConnection.close(rs, pstmt, conn);
	   }
   }  
   
   
   public int deleteFaq(int id,String pw,String sid) {
	   int i=-1;
	   try {
		   conn = OracleConnection.getConnection();
		   pstmt = conn.prepareStatement("select * from admin_faq where question_id = ? ");
		   pstmt.setInt(1, id);
		   rs = pstmt.executeQuery();
		   if(rs.next()) {
			   pstmt = conn.prepareStatement("select * from member_info where id=? and pw=?");
			   pstmt.setString(1, sid);
			   pstmt.setString(2, pw);
			   ResultSet memberRs = pstmt.executeQuery();
			   if(memberRs.next()) {
				   sql = "delete from admin_faq where question_id = ?";
				   pstmt = conn.prepareStatement(sql);
				   pstmt.setInt(1, id);
				   pstmt.executeUpdate();
				   i = 0;
			   }else {
				   i = -1;
			   }
		   }
	   }catch(Exception ex) {
		   ex.printStackTrace();
	   }finally {
		   
	   }
	   return i;
   }
   
   // 테이블에 레코드 값을 넣어주는 메서드
   public void insertfaqList(FaqDTO faqList) {
      try {
         conn = OracleConnection.getConnection();
         sql="insert into admin_faq values(admin_faq_seq.NEXTVAL,?,?,sysdate,?)"; 
         // admin_faq테이블에 시퀀스 객체 admin_faq_seq를 사용 > 일련의 고유한 값을 생성, nextval은 시퀀스에서 다음 값을 가져온다는 의미
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,faqList.getQuestion_text());
         pstmt.setString(2,faqList.getAnswer_text());
         pstmt.setString(3,faqList.getWriter());
         pstmt.executeUpdate();
      } catch(Exception ex) {
         ex.printStackTrace();
      } finally {
         OracleConnection.close(rs, pstmt, conn);
      }
   }
   
   // 질문 ID를 통해 해당 FAQ를 조회하는 메서드
   public FaqDTO getFaqById(String question_id) {
      FaqDTO faq = null;
      
      try {
         conn = OracleConnection.getConnection();
         sql = "select * from admin_faq where question_id=?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, question_id);
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            faq = new FaqDTO();
            faq.setQuestion_id(rs.getInt("question_id"));
            faq.setQuestion_text(rs.getString("question_text"));
            faq.setAnswer_text(rs.getString("answer_text"));
            faq.setReg_date(rs.getTimestamp("reg_date"));
            faq.setWriter(rs.getString("writer"));
         }
      } catch(Exception e) {
         e.printStackTrace();
      } finally {
         OracleConnection.close(rs, pstmt, conn);
      }
      return faq;
   }
   
   // FAQ의 총 개수를 반환하는 메서드
   public int getFaqCount() {
      int count = 0;
      
      try {
         conn = OracleConnection.getConnection();
         sql = "select count(*) from admin_faq";   // admin_faq 테이블의 총 행 수를 반환하는 쿼리문
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            count = rs.getInt(1);
         }
      }catch (Exception e) {
         e.printStackTrace();
      }finally {
         OracleConnection.close(rs, pstmt, conn);
      }
      return count;
   }
   
   // FAQ 목록을 가져오는 메서드
   public List<FaqDTO> getFaqList(int startRow, int endRow){
      
      List<FaqDTO> faqList = new ArrayList<>();
     
      
      try {
         conn = OracleConnection.getConnection();
         sql = "select * from(select rownum as rnum, question_id, question_text, answer_text, reg_date , writer " // 띄어쓰기를 안하면 붙어버려서 reg_date from 이렇게 됨
                  + " from (select * from admin_faq order by question_id desc)) "   // question_id를 기준으로 내림차순 정의
                + " where rnum between ? and ?";   // rnum이 특정 범위 내에 있는 행들을 선택
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         rs = pstmt.executeQuery();
         while(rs.next()){
               FaqDTO faq = new FaqDTO();
               faq.setQuestion_id(rs.getInt("question_id"));
               faq.setQuestion_text(rs.getString("question_text"));
               faq.setAnswer_text(rs.getString("answer_text"));
               faq.setReg_date(rs.getTimestamp("reg_date"));
               faq.setWriter(rs.getString("writer"));
               faqList.add(faq);
               }
         }catch(Exception e) {
            e.printStackTrace();
   }finally {
      OracleConnection.close(rs, pstmt, conn);
   }
      return faqList;
   }
}