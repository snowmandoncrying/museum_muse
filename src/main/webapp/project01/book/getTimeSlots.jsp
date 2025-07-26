<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, javax.naming.*, javax.sql.*" %>
<%@ page import="web.bean.dto.BoardDTO" %>
<%@ page import="web.bean.dao.BoardDAO" %>
<%@ page import="web.bean.dto.UserDTO" %>
<%@ page import="web.bean.dao.UserDAO" %>
<%@ page import="web.bean.dto.BookDTO" %>
<%@ page import="web.bean.dao.BookDAO" %>
<%
    String url = "jdbc:oracle:thin:@192.168.219.198:1521:orcl";
    String dbUser = "project01";
    String dbPassword = "project01";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    int exhibitNumber = Integer.parseInt(request.getParameter("exhibit_number"));
    String date = request.getParameter("date");

    // 전시 시간대 및 해당 시간대의 예약 현황을 저장할 배열 초기화
    String[] exhibitTimes = new String[4];
    int[] reservations = new int[4];

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        // 파라미터로 받은 전시번호의 시간대 조회 쿼리 실행
        String sql = "SELECT EXHIBIT_TIME1, EXHIBIT_TIME2, EXHIBIT_TIME3, EXHIBIT_TIME4 FROM EXHIBIT_BOARD WHERE EXHIBIT_NUMBER = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, exhibitNumber);
        rs = pstmt.executeQuery();

        if (rs.next()) { // 조회된 전시 시간대 값을 배열에 저장
            exhibitTimes[0] = rs.getString("EXHIBIT_TIME1");
            exhibitTimes[1] = rs.getString("EXHIBIT_TIME2");
            exhibitTimes[2] = rs.getString("EXHIBIT_TIME3");
            exhibitTimes[3] = rs.getString("EXHIBIT_TIME4");
        }
        rs.close();
        pstmt.close();

	    // 전시번호에 해당하는 전시이름, 매개변수로 받은 날짜를 시간대 별로 그룹화 된 결과를 얻어서
        // 예약정보를 각 시간대별 총 예약인원(TOTAL_RESERVATIONS)으로 계산
        sql = "SELECT VISIT_TIME, SUM(VISIT_QUANTITY) AS TOTAL_RESERVATIONS FROM RESERVATION_BOARD WHERE EXHIBIT_NAME = "
        +"(SELECT EXHIBIT_NAME FROM EXHIBIT_BOARD WHERE EXHIBIT_NUMBER = ?) AND VISIT_DATE = TO_DATE(?, 'YYYY-MM-DD') GROUP BY VISIT_TIME";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, exhibitNumber);
        pstmt.setString(2, date);
        rs = pstmt.executeQuery();

        // 조회된 예약 현황을 배열에 저장
        while (rs.next()) {
            String time = rs.getString("VISIT_TIME");
            int totalReservations = rs.getInt("TOTAL_RESERVATIONS");
            for (int i = 0; i < exhibitTimes.length; i++) {
            	// exhibitTimes[i]가 null이 아니고 time과 같은 경우
                if (exhibitTimes[i] != null && exhibitTimes[i].equals(time)) {
                    reservations[i] = totalReservations;// reservations 배열의 해당 인덱스(i)에 예약된 인원 수를 저장
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }

    // JSON 형식의 응답 생성
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    //exhibitTimes = ["10:00", "12:00", "14:00", "16:00"]
    //reservations = [5, 8, 12, 4]
    out.print("{\"times\": [\"" + exhibitTimes[0] + "\", \"" + exhibitTimes[1] + "\", \"" + exhibitTimes[2] + "\", \"" + exhibitTimes[3] + "\"], \"reservations\": [" + reservations[0] + ", " + reservations[1] + ", " + reservations[2] + ", " + reservations[3] + "]}");
%>