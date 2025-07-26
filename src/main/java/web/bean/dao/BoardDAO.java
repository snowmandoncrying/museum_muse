package web.bean.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import web.bean.dto.BoardDTO;
import web.bean.dto.UserDTO;
public class BoardDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public int getExhibitNameCount(String exhibit_name) throws Exception {
		int x=0;
		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("select count(*) from exhibit_board where exhibit_name=?");
			pstmt.setString(1, exhibit_name);
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
	
	public int deleteExhibit(int num, String sid, String pw) {

		int x = -1;

		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("select * from exhibit_board where exhibit_number=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pstmt = conn.prepareStatement("select * from member_info where id=? and pw=?");
				pstmt.setString(1, sid);
				pstmt.setString(2, pw);
				ResultSet memberRs = pstmt.executeQuery();
				if(memberRs.next()) {
					sql = "delete from exhibit_board where exhibit_number = ?";
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
	
	public void updateExhibit(BoardDTO exhibit) {
		try {
			conn = OracleConnection.getConnection();
			sql="update exhibit_board set exhibit_grade=?,exhibit_name=?,exhibit_time1=?,"
			+ "exhibit_time2=?,exhibit_time3=?,exhibit_time4=?,author_name=?,"
			+ "start_date=?,end_date=?,exhibit_content=?,exhibit_img=? where exhibit_number = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, exhibit.getExhibit_grade());
			pstmt.setString(2, exhibit.getExhibit_name());
			pstmt.setString(3, exhibit.getExhibit_time1());
			pstmt.setString(4, exhibit.getExhibit_time2());
			pstmt.setString(5, exhibit.getExhibit_time3());
			pstmt.setString(6, exhibit.getExhibit_time4());
			pstmt.setString(7, exhibit.getAuthor_name());
			pstmt.setTimestamp(8, exhibit.getStart_date());
			pstmt.setTimestamp(9, exhibit.getEnd_date());
			pstmt.setString(10, exhibit.getExhibit_content());
			pstmt.setString(11, exhibit.getExhibit_img());
			pstmt.setInt(12, exhibit.getExhibit_number());
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			OracleConnection.close(rs, pstmt, conn);
		}
	}
	
	public BoardDTO getExhibit(int exhibit_number) {
		BoardDTO exhibit=null;
		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("select * from exhibit_board where exhibit_number=?");
			pstmt.setInt(1, exhibit_number);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				exhibit = new BoardDTO();
				exhibit.setExhibit_number(rs.getInt("exhibit_number"));
				exhibit.setExhibit_grade(rs.getString("exhibit_grade"));
				exhibit.setExhibit_name(rs.getString("exhibit_name"));
				exhibit.setExhibit_time1(rs.getString("exhibit_time1"));
				exhibit.setExhibit_time2(rs.getString("exhibit_time2"));
				exhibit.setExhibit_time3(rs.getString("exhibit_time3"));
				exhibit.setExhibit_time4(rs.getString("exhibit_time4"));
				exhibit.setAuthor_name(rs.getString("author_name"));
				exhibit.setStart_date(rs.getTimestamp("start_date"));
				exhibit.setEnd_date(rs.getTimestamp("end_date"));
				exhibit.setExhibit_content(rs.getString("exhibit_content"));
				exhibit.setExhibit_img(rs.getString("exhibit_img"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return exhibit;
	}
	
	public BoardDTO getExhibitName(String exhibit_name) {
		BoardDTO exhibit=null;
		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("select * from exhibit_board where exhibit_name=?");
			pstmt.setString(1, exhibit_name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				exhibit = new BoardDTO();
				exhibit.setExhibit_number(rs.getInt("exhibit_number"));
				exhibit.setExhibit_grade(rs.getString("exhibit_grade"));
				exhibit.setExhibit_name(rs.getString("exhibit_name"));
				exhibit.setExhibit_time1(rs.getString("exhibit_time1"));
				exhibit.setExhibit_time2(rs.getString("exhibit_time2"));
				exhibit.setExhibit_time3(rs.getString("exhibit_time3"));
				exhibit.setExhibit_time4(rs.getString("exhibit_time4"));
				exhibit.setAuthor_name(rs.getString("author_name"));
				exhibit.setStart_date(rs.getTimestamp("start_date"));
				exhibit.setEnd_date(rs.getTimestamp("end_date"));
				exhibit.setExhibit_content(rs.getString("exhibit_content"));
				exhibit.setExhibit_img(rs.getString("exhibit_img"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return exhibit;
	}
	
	public void insertExhibit(BoardDTO exhibit) {
		try {
			conn = OracleConnection.getConnection();
				sql = "insert into exhibit_board(exhibit_number,exhibit_grade,exhibit_name,"
				+ "author_name,start_date,end_date,exhibit_content,exhibit_img,"
				+ "exhibit_time1,exhibit_time2,exhibit_time3,exhibit_time4) "
				+ "values(board_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,exhibit.getExhibit_grade());
			pstmt.setString(2,exhibit.getExhibit_name());
			pstmt.setString(3,exhibit.getAuthor_name());
			pstmt.setTimestamp(4,exhibit.getStart_date());
			pstmt.setTimestamp(5,exhibit.getEnd_date());
			pstmt.setString(6,exhibit.getExhibit_content());
			pstmt.setString(7,exhibit.getExhibit_img());
			pstmt.setString(8,exhibit.getExhibit_time1());
			pstmt.setString(9,exhibit.getExhibit_time2());
			pstmt.setString(10,exhibit.getExhibit_time3());
			pstmt.setString(11,exhibit.getExhibit_time4());
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
	}
	
	public List getExhibits(int start, int end) {
		List exhibitList=null;
		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("select * from exhibit_board order by exhibit_number desc");
			rs = pstmt.executeQuery();
			exhibitList = new ArrayList(end);
			while(rs.next()) {
				BoardDTO exhibit = new BoardDTO();
				exhibit.setExhibit_number(rs.getInt("exhibit_number"));
				exhibit.setExhibit_grade(rs.getString("exhibit_grade"));
				exhibit.setExhibit_name(rs.getString("exhibit_name"));
				exhibit.setExhibit_time1(rs.getString("exhibit_time1"));
				exhibit.setExhibit_time2(rs.getString("exhibit_time2"));
				exhibit.setExhibit_time3(rs.getString("exhibit_time3"));
				exhibit.setExhibit_time4(rs.getString("exhibit_time4"));
				exhibit.setAuthor_name(rs.getString("author_name"));
				exhibit.setStart_date(rs.getTimestamp("start_date"));
				exhibit.setEnd_date(rs.getTimestamp("end_date"));
				exhibit.setExhibit_content(rs.getString("exhibit_content"));
				exhibit.setExhibit_img(rs.getString("exhibit_img"));
				exhibitList.add(exhibit);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return exhibitList;
	}
	
	public int getExhibitCount() throws Exception {
		int x=0;
		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("select count(*) from exhibit_board");
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
}