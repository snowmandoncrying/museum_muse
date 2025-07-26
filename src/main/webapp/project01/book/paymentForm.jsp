<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="web.bean.dto.BoardDTO" %>
<%@ page import="web.bean.dao.BoardDAO" %>
<%@ page import="web.bean.dto.UserDTO" %>
<%@ page import="web.bean.dao.UserDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<jsp:useBean id="dto" class="web.bean.dto.BoardDTO" />
<jsp:setProperty property="*" name="dto" />

<jsp:include page="../projectHeader.jsp"/>

<%
	int num = Integer.parseInt(request.getParameter("exhibit_number"));
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	BoardDAO dbPro = new BoardDAO();
	BoardDTO exhibit = dbPro.getExhibit(num);
	
	String sid = (String)session.getAttribute("sid");
	UserDAO userDAO = new UserDAO();
	UserDTO user = userDAO.user(sid);
	
	String date = request.getParameter("date");
	String time = request.getParameter("time");
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	int amount = quantity * 5000;

	Date reservationDate = new Date();
    String formattedDate = sdf.format(reservationDate);
%>
	
	전시 이름 : <%=exhibit.getExhibit_name() %> <br>
	관람 일시 : <%=date %> <br>
	관람 시간대 : <%=time %> <br>
	예약자 이름 : <%=user.getName() %> <br>
	예약 인원 : <%=quantity %>명 <br>
	결제 금액 : <%=amount %>원 <br>

<body>
	<form action="paymentPro.jsp?exhibit_number=<%=exhibit.getExhibit_number()%>" method="post">
		결제수단 선택<br/>
		<input type="hidden" name="date" value="<%=date %>">
		<input type="hidden" name="time" value="<%=time %>">
		<input type="hidden" name="quantity" value="<%=quantity %>">
		<input type="radio" name="pay" value="신용﹒체크카드" checked> 신용﹒체크카드
		<input type="radio" name="pay" value="무통장 입금"> 무통장 입금<br/>
		<input type="radio" name="pay" value="카카오페이"> 카카오페이
		<input type="radio" name="pay" value="네이버페이"> 네이버페이
		<input type="radio" name="pay" value="토스페이"> 토스페이
		<input type="radio" name="pay" value="애플페이"> 애플페이<br/>
		<button id="payment-button" type="submit">결제하기</button>
		<button type="button" onclick="history.go(-1);">뒤로가기</button>
	</form>
  
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