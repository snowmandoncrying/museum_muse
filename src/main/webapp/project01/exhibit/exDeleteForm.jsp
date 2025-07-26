<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "web.bean.dao.BoardDAO" %>
<%@ page import = "web.bean.dto.BoardDTO" %>
<%@ page import = "web.bean.dao.UserDAO" %> 
<%@ page import = "web.bean.dto.UserDTO" %> 
<jsp:include page="../projectHeader.jsp"/>
<%
	String sgrade = (String)session.getAttribute("sgrade");

	int num = Integer.parseInt(request.getParameter("exhibit_number"));


%>

<center><b>전시정보 삭제</b></center>
	<form action="exDeletePro.jsp" method="post">
		관리자 비밀번호 : <input type="password" name="adminAuthNumber"><br>
		<input type="hidden" name="exhibitNumber" value="<%=num%>"> 
		<input type="submit" value="삭제">
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

