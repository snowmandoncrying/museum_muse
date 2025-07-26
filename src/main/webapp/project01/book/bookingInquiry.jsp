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
	String sid = (String)session.getAttribute("sid");

	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage -1)* pageSize +1;
	int endRow = currentPage * pageSize;
	
	int count = 0;
	List reservationList = null;
	List exhibitList = null;
	BoardDAO boardDAO = new BoardDAO();
	BookDAO dbPro = new BookDAO();
	count = dbPro.getReservationCount(sid);		// 예매수 체크
	if(count==0){
%>		회원님의 예매내역이 존재하지 않습니다.
<%	}else{		// 예매번호를 details.jsp 에 파라미터로 넘겨서 해당 정보 출력
		reservationList = dbPro.getReservations(sid);	// 로그인 한 아이디에 해당하는 예매내역 리스트에 저장
		exhibitList = boardDAO.getExhibits(startRow,endRow);
		int size = reservationList.size();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0 ; i < reservationList.size(); i++){
			BookDTO reservation = (BookDTO)reservationList.get(i);
			
%>			[<%=i+1%>]
			<a href="details.jsp?reservation_id=<%=reservation.getReservationId()%>">
			예매번호 <%=reservation.getReservationId()%> / 전시이름 <%=reservation.getExhibitName()%> / 방문일 <%=sdf.format(reservation.getVisitDate())%>
			</a><hr/>
<%		
		}
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