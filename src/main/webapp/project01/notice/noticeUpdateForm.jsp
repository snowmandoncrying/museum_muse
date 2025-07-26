<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.bean.dao.NoticeDAO" %>
<%@ page import="web.bean.dto.NoticeDTO" %>
<jsp:include page="../projectHeader.jsp"/>
<%
	int num = Integer.parseInt(request.getParameter("noticeNum"));
	NoticeDAO dbPro = new NoticeDAO();
	NoticeDTO notice = dbPro.getNotice(num);
%>

<center><b>공지작성</b></center>
	<form action="noticeUpdatePro.jsp?noticeNum=<%=num %>" name="noticeUpdateForm" method="post">
		<table width="420" border="1" cellspacing="0" cellpadding="0" align="center" >
         <tr>
            <td width="70" align="center">제목</td>
            <td width="330">
               <input type="text" size="40" maxlength="50" name="title">
            </td>
         </tr>
         <tr>
            <td width="70" align="center">작성자</td>               
            <td width="330">
				<%String sid = (String)session.getAttribute("sid");%>
				<%=sid%>
				<input type="hidden" name="author" value=<%=sid%>>
            </td>
         </tr>
         <tr >
            <td width="120" align="center">공지내용</td>
            <td width="330">
               <textarea name="content" rows="13" cols="40"></textarea>
            </td>
         </tr>
      
         <tr>
            <td colspan=2 align="center">
               <input type="submit" value="공지수정"> <input type="reset" value="다시작성">
               <input type="button" value="돌아가기" OnClick="history.go(-1)">
            </td>
         </tr>        
         </table>
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