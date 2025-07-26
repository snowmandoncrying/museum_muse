package web.bean.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import web.bean.dto.PayDTO;

public class PayDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public void pay(PayDTO pay) {
		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("insert into 테이블명 values (?,?,?,?,?,?,?,?)");
			pstmt.setString(1, pay.getExhibit_name());
			pstmt.setString(2, pay.getDate());
			pstmt.setString(3, pay.getTime());			
			pstmt.setString(4, pay.getName());
			pstmt.setInt(5, pay.getQuantity());
			pstmt.setInt(6, pay.getAmount());
			pstmt.setString(7, pay.getFormattedDate());
			pstmt.setString(8, pay.getPay());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}		
	}

	public int check(String name, String date, String time) {
		int result = 0;
		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("select quantity from 예약 where exhibit_name=? and date=? and time=?");
			pstmt.setString(1, name);
			pstmt.setString(2, date);
			pstmt.setString(3, time);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result += rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return result;
	}
}
