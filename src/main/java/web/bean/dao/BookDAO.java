package web.bean.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import web.bean.dto.BoardDTO;
import web.bean.dto.BookDTO;
import web.bean.dto.NoticeDTO;
public class BookDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public void updateReservation(BookDTO book, int reservation_id) {
		try {
			conn = OracleConnection.getConnection();
			sql="update RESERVATION_BOARD set VISIT_DATE=?, VISIT_TIME=?, VISIT_QUANTITY=?, RESERVATION_AMOUNT=?, RESERVATION_DATE=sysdate where RESERVATION_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setTimestamp(1, book.getVisitDate());
			pstmt.setString(2, book.getVisitTime());
			pstmt.setInt(3, book.getVisitQuantity());
			pstmt.setInt(4, book.getReservationAmount());
			pstmt.setInt(5, reservation_id);
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			OracleConnection.close(rs, pstmt, conn);
		}
	}
	
	public int getPeoples(String exhibit_name, String date, String time) {
		int people = 0;
		try {
			conn = OracleConnection.getConnection();
			sql = "select sum(visit_quantity) from reservation_board where exhibit_name = ? and visit_date = to_date(?, 'YYYY-MM-DD') and visit_time = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, exhibit_name);
			pstmt.setString(2, date);
			pstmt.setString(3, time);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				people = rs.getInt(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return people;
	}
	
	public List<BookDTO> getBookings(String exhibit_name, int startRow, int endRow) { // 0517 추가
	    List<BookDTO> bookingList = new ArrayList<>();
	    try {
	        conn = OracleConnection.getConnection();
	        sql = "SELECT * FROM (" +
	                     "  SELECT ROWNUM AS rnum, reservation_id, exhibit_name, visit_date, visit_time, user_id, user_name, user_phone, visit_quantity, reservation_amount, payment_method, reservation_date" +
	                     "  FROM (SELECT * FROM reservation_board WHERE exhibit_name = ? ORDER BY reservation_id DESC)" +
	                     "  WHERE ROWNUM <= ?" +
	                     ") WHERE rnum >= ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, exhibit_name);
	        pstmt.setInt(2, endRow);
	        pstmt.setInt(3, startRow);
	        rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	            BookDTO booking = new BookDTO();
	            booking.setReservationId(rs.getInt("reservation_id"));
	            booking.setExhibitName(rs.getString("exhibit_name"));
	            booking.setVisitDate(rs.getTimestamp("visit_date"));
	            booking.setVisitTime(rs.getString("visit_time"));
	            booking.setUserId(rs.getString("user_id"));
	            booking.setUserName(rs.getString("user_name"));
	            booking.setUserPhone(rs.getString("user_phone"));
	            booking.setVisitQuantity(rs.getInt("visit_quantity"));
	            booking.setReservationAmount(rs.getInt("reservation_amount"));
	            booking.setPaymentMethod(rs.getString("payment_method"));
	            booking.setReservationDate(rs.getTimestamp("reservation_date"));
	            bookingList.add(booking);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        OracleConnection.close(rs, pstmt, conn);
	    }
	    return bookingList;
	}
	
	public int getBookingCount(int exhibit_number){ // 0517 추가
		int people=0;
		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("select count(*) from reservation_board where exhibit_name = (select exhibit_name from exhibit_board where exhibit_number = ?)");
			pstmt.setInt(1, exhibit_number);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				people = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return people;
	}
	
	public BookDTO reservationInfo(int reservation_id) {
		BookDTO reservation = null;
		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("select * from RESERVATION_BOARD where RESERVATION_ID=?");
			pstmt.setInt(1, reservation_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				reservation = new BookDTO();
				reservation.setReservationId(rs.getInt("RESERVATION_ID"));
				reservation.setExhibitName(rs.getString("EXHIBIT_NAME"));
				reservation.setVisitDate(rs.getTimestamp("VISIT_DATE"));
				reservation.setVisitTime(rs.getString("VISIT_TIME"));
				reservation.setUserId(rs.getString("USER_ID"));
				reservation.setUserName(rs.getString("USER_NAME"));
				reservation.setUserPhone(rs.getString("USER_PHONE"));
				reservation.setVisitQuantity(rs.getInt("VISIT_QUANTITY"));
				reservation.setReservationAmount(rs.getInt("RESERVATION_AMOUNT"));
				reservation.setReservationDate(rs.getTimestamp("RESERVATION_DATE"));
				reservation.setPaymentMethod(rs.getString("PAYMENT_METHOD"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return reservation;
	}
	
	public List getReservations(String sid) {
		List reservationList=null;
		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("select * from RESERVATION_BOARD where user_id=? order by VISIT_DATE");
			pstmt.setString(1, sid);
			rs = pstmt.executeQuery();
			reservationList = new ArrayList();
			while(rs.next()) {
				BookDTO reservation = new BookDTO();
				reservation.setReservationId(rs.getInt("RESERVATION_ID"));
				reservation.setExhibitName(rs.getString("EXHIBIT_NAME"));
				reservation.setVisitDate(rs.getTimestamp("VISIT_DATE"));
				reservation.setVisitTime(rs.getString("VISIT_TIME"));
				reservation.setUserId(rs.getString("USER_ID"));
				reservation.setUserName(rs.getString("USER_NAME"));
				reservation.setUserPhone(rs.getString("USER_PHONE"));
				reservation.setVisitQuantity(rs.getInt("VISIT_QUANTITY"));
				reservation.setReservationAmount(rs.getInt("RESERVATION_AMOUNT"));
				reservation.setPaymentMethod(rs.getString("PAYMENT_METHOD"));
				reservation.setReservationDate(rs.getTimestamp("RESERVATION_DATE"));
				reservationList.add(reservation);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return reservationList;
	}
	
//	public int getBookingCount(String exhibit) throws Exception {
//		int x=0;
//		try {
//			conn = OracleConnection.getConnection();
//			pstmt = conn.prepareStatement("select count(*) from RESERVATION_BOARD where user_id=? ");
//			pstmt.setString(1, user_id);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				x= rs.getInt(1); 
//			}
//		} catch(Exception ex) {
//			ex.printStackTrace();
//		} finally {
//			OracleConnection.close(rs, pstmt, conn);
//		}
//		return x; 
//	}
	
	public int getReservationCount(String user_id) throws Exception {
		int x=0;
		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("select count(*) from RESERVATION_BOARD where user_id=? ");
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1); 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return x; 
	}
	
	public void insertReservation(BookDTO book) {
		try {
			conn = OracleConnection.getConnection();
			sql="insert into reservation_board(reservation_id, exhibit_name, visit_date, visit_time, user_id, user_name, user_phone, visit_quantity, reservation_amount, reservation_date, payment_method)"
					+ "values(reservation_board_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getExhibitName());
			pstmt.setTimestamp(2, book.getVisitDate());
			pstmt.setString(3, book.getVisitTime());
			pstmt.setString(4, book.getUserId());
			pstmt.setString(5, book.getUserName());
			pstmt.setString(6, book.getUserPhone());
			pstmt.setInt(7, book.getVisitQuantity());
			pstmt.setInt(8, book.getReservationAmount());
			pstmt.setTimestamp(9, book.getReservationDate());
			pstmt.setString(10, book.getPaymentMethod());
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			OracleConnection.close(rs, pstmt, conn);
		}
	}
	
	public int cancleReservation(int num, String sid, String pw) {

		int x = -1;

		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("select * from reservation_board where reservation_id=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pstmt = conn.prepareStatement("select * from member_info where id=? and pw=?");
				pstmt.setString(1, sid);
				pstmt.setString(2, pw);
				ResultSet memberRs = pstmt.executeQuery();
				if(memberRs.next()) {
					sql = "delete from reservation_board where reservation_id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x=0;
				}else {
					x=1;
				}
				
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return x;
	}
}	