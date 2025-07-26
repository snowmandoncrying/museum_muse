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
    // DB 연결 설정
    String url = "jdbc:oracle:thin:@192.168.219.198:1521:orcl";
    String dbUser = "project01";
    String dbPassword = "project01";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // 전달받은 exhibit_number
    int exhibitNumber = Integer.parseInt(request.getParameter("exhibit_number"));
    
    // 전시 정보 가져오기
    String exhibitName = "";
    java.util.Date startDate = null;
    java.util.Date endDate = null;
    String[] exhibitTimes = new String[4];

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(url, dbUser, dbPassword);

        String sql = "SELECT EXHIBIT_NAME, START_DATE, END_DATE, EXHIBIT_TIME1, EXHIBIT_TIME2, EXHIBIT_TIME3, EXHIBIT_TIME4 FROM EXHIBIT_BOARD WHERE EXHIBIT_NUMBER = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, exhibitNumber);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            exhibitName = rs.getString("EXHIBIT_NAME");
            startDate = rs.getDate("START_DATE");
            endDate = rs.getDate("END_DATE");
            exhibitTimes[0] = rs.getString("EXHIBIT_TIME1");
            exhibitTimes[1] = rs.getString("EXHIBIT_TIME2");
            exhibitTimes[2] = rs.getString("EXHIBIT_TIME3");
            exhibitTimes[3] = rs.getString("EXHIBIT_TIME4");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>

<h1>전시회 예약</h1>
<form action="bookPro.jsp?exhibit_number=<%= exhibitNumber %>" method="post" onsubmit="return reservationCheck()">
    <label for="date">날짜 선택 : </label>
    <input type="date" name="date" id="date" min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(startDate) %>" max="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(endDate) %>" onchange="updateTimeSlots()">
    <br>
    <label for="time">시간대 선택 : </label>
    <select name="time" id="time">
        <option value="<%= exhibitTimes[0] %>"><%= exhibitTimes[0] %></option>
        <option value="<%= exhibitTimes[1] %>"><%= exhibitTimes[1] %></option>
        <option value="<%= exhibitTimes[2] %>"><%= exhibitTimes[2] %></option>
        <option value="<%= exhibitTimes[3] %>"><%= exhibitTimes[3] %></option>
    </select>
    <br>
    <label for="quantity">관람인원 선택 : </label>
    <input type="number" name="quantity" id="quantity" min="1" max="4"><br>
    <label>결제금액 : </label>
    <span id="amount"></span>원<br>
    <button type="submit">예약하기</button>
    <button type="reset" onclick="resetAmount()">선택정보 초기화</button>
    <button type="button" onclick="history.go(-1);">뒤로가기</button>
</form>

<div id="current-reservation-info">
    <h3>현재 예약 인원</h3>
    <ul id="reservation-info-list"></ul>
</div>

<script>
function reservationCheck() {
    var date = document.getElementById('date').value;
    var time = document.getElementById('time').value;
    var quantity = document.getElementById('quantity').value;

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "checkReservation.jsp", false); // 비동기 false
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("exhibit_number=<%= exhibitNumber %>&date=" + date + "&time=" + time);

    if (xhr.status == 200) {
        var currentReservation = parseInt(xhr.responseText);
        if (currentReservation + parseInt(quantity) > 20) {
            alert("선택한 시간대에 예약 가능 인원이 초과되었습니다.");
            return false;
        }
    } else {
        alert("예약 확인 중 오류가 발생했습니다.");
        return false;
    }
    return true;
}

function updateTimeSlots() {
    var date = document.getElementById('date').value;

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "getTimeSlots.jsp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            var timeSelect = document.getElementById('time');
            timeSelect.innerHTML = "";
            for (var i = 0; i < response.times.length; i++) {
                var option = document.createElement("option");
                option.value = response.times[i];
                option.text = response.times[i] + " (현재 예약 인원: " + response.reservations[i] + ")";
                if (response.reservations[i] >= 20) {
                    option.disabled = true;
                }
                timeSelect.appendChild(option);
            }

            var reservationInfoList = document.getElementById('reservation-info-list');
            reservationInfoList.innerHTML = "";
            for (var i = 0; i < response.times.length; i++) {
                var listItem = document.createElement("li");
                listItem.textContent = response.times[i] + ": " + response.reservations[i] + "명";
                reservationInfoList.appendChild(listItem);
            }
        }
    };
    xhr.send("exhibit_number=<%= exhibitNumber %>&date=" + date);
}
</script>
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