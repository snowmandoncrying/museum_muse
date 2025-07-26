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
    
<%
	int num = Integer.parseInt(request.getParameter("exhibit_number"));
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	BoardDAO dbPro = new BoardDAO();
	BoardDTO exhibit = dbPro.getExhibit(num);
	
	String sgrade = (String)session.getAttribute("sgrade");
%>
<jsp:include page="projectHeader.jsp"/>

<%

	
	if(exhibit.getExhibit_grade().equals("성인관람")){
		if(sgrade != null){
			if(sgrade.equals("미성년")){
%>			<script>
				alert("미성년자는 이용 불가능한 게시물입니다.");
				history.go(-1);
			</script>	
<%			}
		}else{
%>			<script>
				alert("로그인 후 이용 가능한 게시물입니다.");
				window.location="user/loginForm.jsp";
			</script>
<%
		}
	}
%><center><img width="40%" height="800" src="/project01/project01/upload/<%=exhibit.getExhibit_img()%>"></center>
게시번호 <%=exhibit.getExhibit_number()%>
전시이름 <%=exhibit.getExhibit_name()%>
작가이름 <%=exhibit.getAuthor_name()%>
파일이름 <%=exhibit.getExhibit_img()%>
내용 <%=exhibit.getExhibit_content()%>
전시등급 <%=exhibit.getExhibit_grade()%>
<br/>
전시시간 
	1타임 <%=exhibit.getExhibit_time1()%>
	2타임 <%=exhibit.getExhibit_time2()%>
	3타임 <%=exhibit.getExhibit_time3()%>
	4타임 <%=exhibit.getExhibit_time4()%>
<br/>
시작일 <%=sdf.format(exhibit.getStart_date())%>
마감일 <%=sdf.format(exhibit.getEnd_date())%>
<%
	if(sgrade != null){
		if(sgrade.equals("관리자")){
%>			<a href="exhibit/exUpdateForm.jsp?exhibit_number=<%=num%>">수정</a>
			<a href="exhibit/exDeleteForm.jsp?exhibit_number=<%=num%>">삭제</a>
<%		}
	}
%>

<hr/>
<form action="book/bookForm.jsp?exhibit_number=<%=exhibit.getExhibit_number()%>" method="post">
<button type="submit">예약하기</button>
<button type="button" onclick="history.go(-1);">뒤로가기</button>
</form>

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