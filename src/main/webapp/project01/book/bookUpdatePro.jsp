<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="web.bean.dto.BoardDTO" %>
<%@ page import="web.bean.dao.BoardDAO" %>
<%@ page import="web.bean.dto.UserDTO" %>
<%@ page import="web.bean.dao.UserDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<jsp:useBean id="dto2" class="web.bean.dto.BoardDTO" />
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

    	String date = request.getParameter("date");
    	String time = request.getParameter("time");
    	int quantity = Integer.parseInt(request.getParameter("quantity"));
    	int amount = 0;
    	int newAmount = quantity * 5000;
    	int lastAmount = dto.getReservationAmount();
    	
    	if(newAmount > lastAmount){
    		amount = newAmount - lastAmount;
    		
    	}else if(newAmount == lastAmount){
    		amount = 0;
    	}else {
    		amount = lastAmount - newAmount;
    	}

    	Date reservationDate = new Date();
        String formattedDate = sdf.format(reservationDate);
    %>


    	<h1>예약 정보 확인</h1>

    	전시 이름 : <%=exhibit.getExhibit_name() %> <br>
    	관람 일시 : <%=date %> <br>
    	관람 시간대 : <%=time %> <br>
    	예약 아이디 : <%=sid %> <br>
    	예약자 이름 : <%=user.getName() %> <br>
    	예약자 전화번호 : <%=user.getPhone() %> <br>
    	예약 인원 : <%=quantity %>명 <br>
    <%
    	if(newAmount > lastAmount){
    	%>	추가결제 금액 : <%=amount %>원 <br>
    <form action="bookUpdatePay.jsp?exhibit_number=<%=exhibit.getExhibit_number()%>" method="post" onsubmit="return reservationCheck()">
		결제수단 선택<br/>
		<input type="hidden" name="reservation_id" value="<%=reservation_id %>">
		<input type="hidden" name="date" value="<%=date %>">
		<input type="hidden" name="time" value="<%=time %>">
		<input type="hidden" name="quantity" value="<%=quantity %>">
		<input type="hidden" name="amount" value="<%=newAmount %>">
		<input type="radio" name="pay" value="신용﹒체크카드" checked> 신용﹒체크카드
		<input type="radio" name="pay" value="무통장 입금"> 무통장 입금<br/>
		<input type="radio" name="pay" value="카카오페이"> 카카오페이
		<input type="radio" name="pay" value="네이버페이"> 네이버페이
		<input type="radio" name="pay" value="토스페이"> 토스페이
		<input type="radio" name="pay" value="애플페이"> 애플페이<br/>
		<button id="payment-button" type="submit">변경하기</button>
		<button type="button" onclick="history.go(-1);">뒤로가기</button>
	</form>
    <%	}else if(newAmount == lastAmount){
    	%>	추가결제가 필요하지 않습니다. <br>
	<form action="bookUpdatePay.jsp?exhibit_number=<%=exhibit.getExhibit_number()%>" method="post" onsubmit="return reservationCheck()">
		<input type="hidden" name="reservation_id" value="<%=reservation_id %>">
		<input type="hidden" name="amount" value="<%=newAmount %>">
		<input type="hidden" name="date" value="<%=date %>">
		<input type="hidden" name="time" value="<%=time %>">
		<input type="hidden" name="quantity" value="<%=quantity %>">
		<button id="payment-button" type="submit">변경하기</button>
		<button type="button" onclick="history.go(-1);">뒤로가기</button>
	</form>
    <%	}else{
    	%>	환불 금액 : <%=amount %>원 <br>
    <form action="bookUpdatePay.jsp?exhibit_number=<%=exhibit.getExhibit_number()%>" method="post" onsubmit="return reservationCheck()">
    	<input type="hidden" name="reservation_id" value="<%=reservation_id %>">
    	<input type="hidden" name="amount" value="<%=newAmount %>">
    	<input type="hidden" name="date" value="<%=date %>">
		<input type="hidden" name="time" value="<%=time %>">
		<input type="hidden" name="quantity" value="<%=quantity %>">
		차액 환불계좌 선택<br/>
		<select name="wallet" id="wallet" >
            <option value="국민은행">기업은행</option>
            <option value="신한은행">국민은행</option>
            <option value="신한은행">신한은행</option>
            <option value="신한은행">하나은행</option>
            <option value="신한은행">우리은행</option>
            <option value="신한은행">카카오</option>
        </select>
        <input type="text" name="wallet_number"><br>
		<button id="payment-button" type="submit">변경하기</button>
		<button type="button" onclick="history.go(-1);">뒤로가기</button>
	</form>
    <% 	}
    %>
    

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
