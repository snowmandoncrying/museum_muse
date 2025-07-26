<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "web.bean.dao.BookDAO" %>
<%@ page import = "web.bean.dto.BookDTO" %>
<%@ page import = "web.bean.dao.BoardDAO" %>
<%@ page import = "web.bean.dto.BoardDTO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<jsp:include page="../projectHeader.jsp"/>
<%
	int num = Integer.parseInt(request.getParameter("exhibit_number"));
	BoardDAO boardDAO = new BoardDAO();
	BoardDTO boardDTO = boardDAO.getExhibit(num);
	
	String name = boardDTO.getExhibit_name();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
	   pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage -1)* pageSize +1;
	int endRow = currentPage * pageSize;

	List bookingList = null;
	BookDAO dbPro = new BookDAO();
	int count = 0;
	count = dbPro.getBookingCount(num);
	
	if(count>0){
		bookingList = dbPro.getBookings(name,startRow,endRow);
	}
	if(count==0){ %>
		현재 예매자가 없습니다.
<%	}else{ 
		for(int i = 0 ; i < bookingList.size();i++){
		BookDTO booking = (BookDTO)bookingList.get(i);
	%>
	예매번호 <%=booking.getReservationId()%>/
	전시제목 <%=booking.getExhibitName()%>/
	방문일 <%=sdf.format(booking.getVisitDate())%>/
	방문시간 <%=booking.getVisitTime()%>/
	회원ID <%=booking.getUserId()%>/
	이름 <%=booking.getUserName()%>/
	번호 <%=booking.getUserPhone()%>/
	방문인원 <%=booking.getVisitQuantity()%>/
	결제액 <%=booking.getReservationAmount()%>/
	결제일 <%=sdf.format(booking.getReservationDate())%>/
	결제수단 <%=booking.getPaymentMethod()%>
	<a href="../book/bookUpdateForm.jsp?reservation_id=<%=booking.getReservationId()%>">수정</a> 
	<a href="../book/bookCancleForm.jsp?reservation_id=<%=booking.getReservationId()%>">삭제</a><br/>
<%}
} %>
<%
	if(count >0){
	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		if(startPage > 10){
%>			<a href="reservationManagementPro.jsp?exhibit_number=<%=num %>&pageNum=<%= startPage-10 %>">[이전]</a>
<%		}
		for (int i = startPage ; i<= endPage ; i++){
%>			<a href="reservationManagementPro.jsp?exhibit_number=<%=num %>&pageNum=<%= i %>">[<%= i %>]</a>
<%		}
		if(endPage < pageCount){
%>			<a href="reservationManagementPro.jsp?exhibit_number=<%=num %>&pageNum=<%= startPage+10 %>">[다음]</a>
<%		}
	}
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