<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Date" %>
<%@ page import="web.bean.dto.BoardDTO" %>
<%@ page import="web.bean.dao.BoardDAO" %>
<jsp:useBean id="dto" class="web.bean.dto.BookDTO"/>
<jsp:useBean id="dao" class="web.bean.dao.BookDAO"/>
<%@ page import="java.text.SimpleDateFormat" %>
<jsp:include page="../projectHeader.jsp"/>
<%
	int reservation_id = Integer.parseInt(request.getParameter("reservation_id"));
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	dto = dao.reservationInfo(reservation_id);	// 예매번호에 해당하는 정보 저장
	Date visitDate = dto.getVisitDate();
	Timestamp currentTime = new Timestamp(System.currentTimeMillis());
	BoardDAO boardDAO = new BoardDAO();
	int exhibitNameCount = boardDAO.getExhibitNameCount(dto.getExhibitName());
%>
<h3>전시회 명 : <%=dto.getExhibitName() %></h3>
<h3>전시회 방문날짜 : <%=sdf.format(dto.getVisitDate()) %></h3>
<h3>전시회 방문시간 : <%=dto.getVisitTime() %></h3>
<h3>예약자 명 : <%=dto.getUserName() %></h3>
<h3>인원수 : <%=dto.getVisitQuantity() %></h3>
<h3>결제 금액 : <%=dto.getReservationAmount() %></h3>
<h3>결제 날짜 : <%=sdf.format(dto.getReservationDate()) %></h3>

<%
	if(visitDate.getTime() >= currentTime.getTime()&&exhibitNameCount!=0){
%>	<button type="button" onclick="window.location.href='bookUpdateForm.jsp?reservation_id=<%=reservation_id %>'">예약 변경</button>
	<button type="button" onclick="window.location.href='bookCancleForm.jsp?reservation_id=<%=reservation_id %>'">예약 취소</button>
	<button type="button" onclick="history.go(-1);">뒤로가기</button>
<%	}else{
%>	해당 예약은 예약변경 및 취소를 하실 수 없습니다.
	<button type="button" onclick="history.go(-1);">뒤로가기</button>
<%}
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