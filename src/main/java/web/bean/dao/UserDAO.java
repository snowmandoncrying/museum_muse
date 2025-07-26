package web.bean.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import web.bean.dto.UserDTO;

public class UserDAO {
   
   private Connection conn = null;
   private PreparedStatement pstmt = null;
   private ResultSet rs = null;
   private String sql = null;
   
   public int Pw(String pw , String id , String newPw) {
      int result = 0;
      try {
         conn = OracleConnection.getConnection();
         sql = "update member_info set pw=? where id=? and pw=?"; // 변경할 비밀번호 , 현재 아이디 , 비밀번호 확인
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, newPw);
         pstmt.setString(2, id);
         pstmt.setString(3, pw);
         result = pstmt.executeUpdate();
      }catch(Exception e) { 
         e.printStackTrace();
      }finally {
         OracleConnection.close(rs, pstmt, conn);
      }
      return result;
   }

   
   public int userDelete(String id, String pw) {
      int result = 0;
      
      try {
         conn = OracleConnection.getConnection();
         sql = "delete from member_info where id=? and pw=?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         pstmt.setString(2, pw);
         result = pstmt.executeUpdate();
         if(result!=0) {
        	 sql = "delete from reservation_board where user_id = ?";
        	 pstmt = conn.prepareStatement(sql);
        	 pstmt.setString(1, id);
        	 pstmt.executeUpdate();
         }
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         OracleConnection.close(rs, pstmt, conn);
      }
      return result;
   }
   
   public String loginGrade(String id, String pw) {
      String grade = null;
      
      try{
         conn = OracleConnection.getConnection();
         sql = "select grade from member_info where id=? and pw=?";
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         pstmt.setString(2, pw);
      
         rs = pstmt.executeQuery();
      
         if(rs.next()) {
            grade = rs.getString("grade");
         }
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         OracleConnection.close(rs, pstmt, conn);
      }
      return grade;
   }
   
   
   public String findPwById(String id,String phone) {
         String foundPw = null;
         
         try {
            conn = OracleConnection.getConnection();
            sql = "select pw from member_info where id=? and phone=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, phone);
            
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
               foundPw = rs.getString("pw");
               }
         }catch(Exception e) {
            e.printStackTrace();
         }finally {
            OracleConnection.close(rs, pstmt, conn);
         }
         return foundPw;
      }
   
   public String findIdByPhone(String phone, String name) {
      String foundId = null;
      try {
         conn = OracleConnection.getConnection();
         sql = "select id from member_info where phone=? and name=?";
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, phone);
         pstmt.setString(2, name);
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            foundId = rs.getString("id");
            }
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         OracleConnection.close(rs, pstmt, conn);
      }
      return foundId;
   }
   
   public int loginCheck(UserDTO dto) {
      int result = 0;
      try {
         conn = OracleConnection.getConnection();
         sql = "select count(*) from member_info where id=? and pw=?";
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,dto.getId());
         pstmt.setString(2,dto.getPw());
         rs = pstmt.executeQuery();
         rs.next();
         result = rs.getInt(1);
         
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         OracleConnection.close(rs, pstmt, conn);
      }
      return result;
   }
   
   public void userInput(UserDTO dto) {
      try {
         conn = OracleConnection.getConnection();
         sql="insert into member_info(id,name,birth,gender,email,phone,address,reg,pw,grade) values(?,?,?,?,?,?,?,sysdate,?,?)";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1,dto.getId());
         pstmt.setString(2,dto.getName());
         pstmt.setString(3,dto.getBirth());
         pstmt.setString(4,dto.getGender());
         pstmt.setString(5,dto.getEmail());
         pstmt.setString(6,dto.getPhone());
         pstmt.setString(7,dto.getAddress());
         pstmt.setString(8,dto.getPw());      
         pstmt.setString(9,dto.getGrade());
         pstmt.executeUpdate();
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         OracleConnection.close(rs, pstmt, conn);
      }
   }
   
   public int idCheck(String id) {
      int result = 0;
      try {
         conn = OracleConnection.getConnection();
         sql = "select count(*) from member_info where id=?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();
         rs.next();
         result = rs.getInt(1);
         
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         OracleConnection.close(rs, pstmt, conn);
      }
      return result;
   }
   
   public UserDTO user(String id) {
      UserDTO dto = null;
      try {
         conn = OracleConnection.getConnection();
         sql = "select * from member_info where id=?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();
         rs.next();
         
         dto = new UserDTO();
         dto.setId(rs.getString("id"));
         dto.setName(rs.getString("name"));
         dto.setBirth(rs.getString("birth"));
         dto.setGender(rs.getString("gender"));
         dto.setEmail(rs.getString("email"));
         dto.setPhone(rs.getString("phone"));
         dto.setAddress(rs.getString("address"));
         dto.setReg(rs.getString("reg"));
         dto.setPw(rs.getString("pw"));
         dto.setGrade(rs.getString("grade"));
         rs.getString("id");
         rs.getString("name");
         rs.getString("birth");
         rs.getString("gender");
         rs.getString("email");
         rs.getString("phone");
         rs.getString("address");
         rs.getString("reg");
         rs.getString("pw");
         rs.getString("grade");

      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         OracleConnection.close(rs, pstmt, conn);
      }
      return dto;
   }

}