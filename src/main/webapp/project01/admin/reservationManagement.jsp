<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "web.bean.dao.BoardDAO" %>
<%@ page import = "web.bean.dto.BoardDTO" %>
<%@ page import = "java.util.List" %>
<jsp:include page="../projectHeader.jsp"/>
<%
   String sgrade = (String)session.getAttribute("sgrade");

   int pageSize = 10;
   String pageNum = request.getParameter("pageNum");
   if(pageNum == null){
      pageNum = "1";
   }

   int currentPage = Integer.parseInt(pageNum);
   int startRow = (currentPage -1)* pageSize +1;
   int endRow = currentPage * pageSize;
   int count = 0;
   List exhibitList = null;
   BoardDAO dbPro = new BoardDAO();
   count = dbPro.getExhibitCount();
   if(count>0){
      exhibitList = dbPro.getExhibits(startRow,endRow);
   }
%>

        <%if(count==0){ %>
   현재 전시중인 작품이 없습니다.
	<%}else{ 
		 for(int i = 0 ; i < exhibitList.size();i++){
 	     BoardDTO exhibit = (BoardDTO)exhibitList.get(i);
   %>
      <a href="reservationManagementPro.jsp?exhibit_number=<%=exhibit.getExhibit_number()%>">
         <img width=40 height=50 src="/project01/project01/upload/<%=exhibit.getExhibit_img()%>">
      </a>
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
%>			<a href="reservationManagement.jsp?pageNum=<%= startPage-10 %>">[이전]</a>
<%		}
		for (int i = startPage ; i<= endPage ; i++){
%>			<a href="reservationManagement.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%		}
		if(endPage < pageCount){
%>			<a href="reservationManagement.jsp?pageNum=<%= startPage+10 %>">[다음]</a>
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