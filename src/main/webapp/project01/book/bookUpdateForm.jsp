<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="web.bean.dto.BoardDTO" %>
<%@ page import="web.bean.dao.BoardDAO" %>
<%@ page import="web.bean.dto.UserDTO" %>
<%@ page import="web.bean.dao.UserDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<jsp:useBean id="dto" class="web.bean.dto.BookDTO" />
<jsp:useBean id="dao" class="web.bean.dao.BookDAO"/>
<jsp:setProperty property="*" name="dto" />
<jsp:include page="../projectHeader.jsp"/>
    <%
         int reservation_id = Integer.parseInt(request.getParameter("reservation_id"));
       dto = dao.reservationInfo(reservation_id);
       String exhibitName = dto.getExhibitName();
       
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        BoardDAO dbPro = new BoardDAO();
        BoardDTO exhibit = dbPro.getExhibitName(exhibitName);
        String sid = (String) session.getAttribute("sid");

        UserDAO userDAO = new UserDAO();
        UserDTO user = userDAO.user(sid);

        Date currentDate = new Date();
        Date startDate = exhibit.getStart_date().before(currentDate) ? currentDate : exhibit.getStart_date();
        Date endDate = exhibit.getEnd_date();

        String formattedStartDate = sdf.format(startDate);
        String formattedEndDate = sdf.format(endDate);
    %>
	<script src = "reservationCheck.js"></script>
    <h1>전시회 예약 변경</h1>
    <form action="bookUpdatePro.jsp?reservation_id=<%=reservation_id%>" method="post" onsubmit="return reservationCheck()"><br>
        <label for="date">날짜 선택 : </label>
        <input type="date" name="date" id="date" min="<%=formattedStartDate%>" max="<%=formattedEndDate%>" onchange="updateTimeSlots()">
        <br>
        <label for="date">시간대 선택 : </label>
        <select name="time" id="time">
            <option value="<%=exhibit.getExhibit_time1()%>"><%=exhibit.getExhibit_time1()%></option>
            <option value="<%=exhibit.getExhibit_time2()%>"><%=exhibit.getExhibit_time2()%></option>
            <option value="<%=exhibit.getExhibit_time3()%>"><%=exhibit.getExhibit_time3()%></option>
            <option value="<%=exhibit.getExhibit_time4()%>"><%=exhibit.getExhibit_time4()%></option>
        </select>
        <br>
        <label for="quantity">관람인원 선택 : </label>
        <input type="number" name="quantity" id="quantity" min="1" max="4"><br>
        <label>결제금액 : </label>
        <span id="amount"></span>원<br>
        <button type="submit">변경하기</button>
        <button type="reset" onclick="resetAmount()">선택정보 초기화</button>
        <button type="button" onclick="history.go(-1);">뒤로가기</button>
    </form>

    <script>
        function resetAmount() {
            document.getElementById('amount').innerText = '0';
        }

        document.getElementById('quantity').addEventListener('input', function () {
            var quantity = parseInt(this.value);
            var amount = quantity * 5000;
            document.getElementById('amount').innerText = amount;
        });
        function updateTimeSlots() {
            var date = document.getElementById('date').value;	// 날짜 입력 필드에서 선택된 값을 가져옴
            var xhr = new XMLHttpRequest();	// 새로운 XMLHttpRequest 객체를 생성
            xhr.open("POST", "getTimeSlots.jsp", true);	// XMLHttpRequest 객체를 사용해 getTimeSlots.jsp로 POST 요청을 초기화
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");	// 요청의 Content-Type 헤더를 설정
            xhr.onreadystatechange = function () {	// 서버로부터 응답이 도착했을 때 실행할 함수
				// 응답이 완료되고 성공했는지 확인
                // (xhr.readyState == 4 - '요청이 완료됨')(xhr.status == 200 - '응답 반환 성공')
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var response = JSON.parse(xhr.responseText); // 응답 텍스트를 JSON 객체로 파싱하여 JSON 형식의 문자열을 JavaScript 객체로 변환
                    var timeSelect = document.getElementById('time'); // 시간 선택 드롭다운 메뉴를 가져옴
                    timeSelect.innerHTML = ""; // 드롭다운 메뉴를 비움
                    
                    for (var i = 0; i < response.times.length; i++) { // 응답에서 각 시간대를 반복
                        var option = document.createElement("option"); // 새로운 옵션 요소를 생성
                        option.value = response.times[i]; // 옵션 값과 텍스트를 번호에 맞게 설정
                        option.text = response.times[i] + " (현재 예약 인원: " + response.reservations[i] + ")";
                        // 현재 예약 인원이 20명 이상인 시간대는 비활성화
                        if (response.reservations[i] >= 20) {
                            option.disabled = true;
                        }
                        timeSelect.appendChild(option); // 옵션 요소를 드롭다운 메뉴에 추가
                    }
                }
            };
            // 선택된 날짜와 전시회 번호를 포함한 데이터를 getTimeSlots.jsp로 전송
            xhr.send("exhibit_number=<%= exhibit.getExhibit_number() %>&date=" + date);
        }
    </script>

</body>


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

