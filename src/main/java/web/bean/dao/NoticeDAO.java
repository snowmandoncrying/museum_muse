package web.bean.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import web.bean.dto.NoticeDTO;
public class NoticeDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = null;
	
	public void updateNotice(NoticeDTO notice) {
		try {
			conn = OracleConnection.getConnection();
			sql = "update notices set title=?,content=?,updated_at=sysdate where notices_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setInt(3, notice.getNotices_num());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
	}
	
	public int deleteNotice(int num,String pw,String sid) {
		int x=-1;
		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("select * from notices where notices_num = ?");	// 해당 게시물 유무 확인
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pstmt = conn.prepareStatement("select * from member_info where id=? and pw=?"); // 접속한 아이디와 비밀번호 일치하는지 확인
				pstmt.setString(1, sid);
				pstmt.setString(2, pw);
				ResultSet memberRs = pstmt.executeQuery();
	            if (memberRs.next()) {	// 확인이 되었을때 해당 게시물 삭제
					sql = "delete from notices where notices_num = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x=0;	// deletePro 에서 삭제 유무를 판단하기 위해 리턴값 수정
				}else {
					x=1;
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return x;
	}
	
	public NoticeDTO getNotice(int notices_num) {
		NoticeDTO notice=null;
		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("select * from notices where notices_num=?");
			pstmt.setInt(1, notices_num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				notice = new NoticeDTO();
				notice.setNotices_num(rs.getInt("notices_num"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("Content"));
				notice.setAuthor(rs.getString("Author"));
				notice.setCreated_at(rs.getTimestamp("Created_at"));
				notice.setUpdated_at(rs.getTimestamp("updated_at"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			OracleConnection.close(rs, pstmt, conn);
		}
		return notice;
	}
	
	public void insertNotice(NoticeDTO notice) {
		try {
			conn = OracleConnection.getConnection();
			sql="insert into notices(NOTICES_NUM,TITLE,CONTENT,AUTHOR,CREATED_AT) values(notices_seq.NEXTVAL,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setString(3, notice.getAuthor());
			pstmt.setTimestamp(4, notice.getCreated_at());
			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			OracleConnection.close(rs, pstmt, conn);
		}
	}
	
	public List<NoticeDTO> getNotices(int startRow, int endRow) {
	    List<NoticeDTO> noticeList = new ArrayList<>();
	    try {
	        conn = OracleConnection.getConnection();
	        String sql = "SELECT * FROM (" +
	                     "  SELECT ROWNUM AS rnum, notices_num, title, content, author, created_at" +
	                     "  FROM (SELECT * FROM notices ORDER BY notices_num DESC)" +
	                     "  WHERE ROWNUM <= ?" +
	                     ") WHERE rnum >= ?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, endRow);
	        pstmt.setInt(2, startRow);
	        rs = pstmt.executeQuery();
	        
	        while (rs.next()) {
	            NoticeDTO notice = new NoticeDTO();
	            notice.setNotices_num(rs.getInt("notices_num"));
	            notice.setTitle(rs.getString("title"));
	            notice.setContent(rs.getString("content"));
	            notice.setAuthor(rs.getString("author"));
	            notice.setCreated_at(rs.getTimestamp("created_at"));
	            noticeList.add(notice);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        OracleConnection.close(rs, pstmt, conn);
	    }
	    return noticeList;
	}
	
	public int getNoticeCount() throws Exception {
		int x=0;
		try {
			conn = OracleConnection.getConnection();
			pstmt = conn.prepareStatement("select count(*) from notices");
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
