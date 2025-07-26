<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="web.bean.dto.BoardDTO" %>
<%@ page import="web.bean.dao.BoardDAO" %>
<%@ page import="web.bean.dto.UserDTO" %>
<%@ page import="web.bean.dao.BookDAO" %>
<%@ page import="web.bean.dto.BookDTO" %>
<%@ page import="web.bean.dao.UserDAO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="dto" class="web.bean.dto.BoardDTO" />
<jsp:useBean id="book" class="web.bean.dto.BookDTO" />
<jsp:setProperty property="*" name="dto" />
<jsp:include page="../projectHeader.jsp"/>
<%

	int num = Integer.parseInt(request.getParameter("exhibit_number"));
	int reservation_id = Integer.parseInt(request.getParameter("reservation_id"));
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	BoardDAO dbPro = new BoardDAO();
	BoardDTO exhibit = dbPro.getExhibit(num);

	String sid = (String)session.getAttribute("sid");
	UserDAO userDAO = new UserDAO();
	UserDTO user = userDAO.user(sid);

	String date = request.getParameter("date");
	String time = request.getParameter("time");

	int quantity = 0;
	String quantityParam = request.getParameter("quantity");
	if (quantityParam != null && !quantityParam.isEmpty()) {
	    try {
	        quantity = Integer.parseInt(quantityParam);
	    } catch (NumberFormatException e) {
	        // quantity를 변환할 수 없는 경우에 대한 예외 처리
	    }
	}

	int amount =  Integer.parseInt(request.getParameter("amount"));

	Timestamp currentTime = new Timestamp(System.currentTimeMillis());
    
	String exhibitName = exhibit.getExhibit_name();
    String userName = user.getName();
    String userPhone = user.getPhone();
    
	Date visit_Date = sdf.parse(date);
	Timestamp visitDate = new Timestamp(visit_Date.getTime());
	

	book.setVisitDate(visitDate);
	book.setVisitTime(time);
	book.setUserId(sid);
	book.setVisitQuantity(quantity);
	book.setReservationAmount(amount);
	book.setReservationDate(currentTime);
	
	BookDAO bookDAO = new BookDAO();
	bookDAO.updateReservation(book, reservation_id);
 
%>
	
</head>

  <body>
    <h3>예약 변경 성공</h3>
    전시 이름 : <%=exhibit.getExhibit_name() %> <br>
	관람 일시 : <%=date %> <br>
	관람 시간대 : <%=time %> <br>
	예약자 이름 : <%=user.getName() %> <br>
	예약 인원 : <%=quantity %>명 <br>
	결제 금액 : <%=amount %>원 <br>
	예약 변경일자 : <%=currentTime %> <br><br>
	
	<form action="../home.jsp" method="post">
        <button type="submit">홈페이지로 이동</button>
        <button type="button" onclick="history.go(-1);">뒤로가기</button>
    </form>
  </body>
</html>
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




