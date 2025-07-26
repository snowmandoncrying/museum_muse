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
    String time = request.getParameter("time");

    int currentReservation = 0;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        String sql = "SELECT SUM(VISIT_QUANTITY) FROM RESERVATION_BOARD WHERE EXHIBIT_NAME = (SELECT EXHIBIT_NAME FROM EXHIBIT_BOARD WHERE EXHIBIT_NUMBER = ?) AND VISIT_DATE = TO_DATE(?, 'YYYY-MM-DD') AND VISIT_TIME = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, exhibitNumber);
        pstmt.setString(2, date);
        pstmt.setString(3, time);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            currentReservation = rs.getInt(1);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }

    out.print(currentReservation);
%>
<footer class="text-body-secondary py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">Back to top</a>
    </p>
    <p class="mb-1">Album example is &copy; Bootstrap, but please download and customize it for yourself!</p>
    <p class="mb-0">New to Bootstrap? <a href="/">Visit the homepage</a> or read our <a href="/docs/5.3/getting-started/introduction/">getting started guide</a>.</p>
  </div>
</footer>
<script src="	https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    </body>
</html>