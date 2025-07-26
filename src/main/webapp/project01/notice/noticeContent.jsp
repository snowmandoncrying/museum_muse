<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.bean.dto.NoticeDTO"%>
<%@ page import="web.bean.dao.NoticeDAO"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%	
    String sgrade = (String)session.getAttribute("sgrade");
	String sid = (String)session.getAttribute("sid");
%>
<jsp:include page="../projectHeader.jsp"/>
<%
   int noticeNum = Integer.parseInt(request.getParameter("notices_num"));
   String pageNum = request.getParameter("pageNum");
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
   NoticeDAO dbPro = new NoticeDAO();
   NoticeDTO notice = dbPro.getNotice(noticeNum);
%>
<h1><%=notice.getTitle()%></h1>
<h5>작성자 : <%=notice.getAuthor()%></h5>
<%=notice.getContent()%><br/>
<h5>작성일 : <%=sdf.format(notice.getCreated_at())%></h5>
<% if(notice.getUpdated_at() != null){%>
<h5>수정일 : <%=sdf.format(notice.getUpdated_at()) %></h5>
<% } %>


<% 
	if(sid != null){
		if(sid.equals(notice.getAuthor())){
%>			<a href="noticeUpdateForm.jsp?noticeNum=<%=noticeNum%>">수정하기</a>
<% 		}
	}
%>


<%
   if(sgrade != null){
         if(sgrade.equals("관리자")){
         %>     <a href="noticeDeleteForm.jsp?noticeNum=<%=noticeNum%>">삭제하기</a>
<%         }
      }%>
      
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
      
      
      
      
      
      
      