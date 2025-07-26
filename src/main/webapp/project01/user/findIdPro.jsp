<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:include page="../projectHeader.jsp"/>
<jsp:useBean id="dto" class="web.bean.dto.UserDTO" />
<jsp:setProperty name="dto"  property="*" />
<jsp:useBean id="dao" class="web.bean.dao.UserDAO" /> 

<%
	String phone = request.getParameter("phone");
	String name = request.getParameter("name");
	String foundId = dao.findIdByPhone(phone,name);
	
	if(foundId != null){
%>
		<h2>아이디가 이미 있습니다.</h2>
		<p>회원님의 아이디는 <%=foundId%> 입니다.</p>
<%
	}else{
%>		<h2>아이디를 찾을 수 없습니다.</h2>
		<p>입력한 휴대폰 번호와 일치하는 아이디가 없습니다.</p>
<% } %>

<a href="loginForm.jsp">로그인 하러 가기</a>
<button type="button" onclick="history.go(-1);">뒤로가기</button>	
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