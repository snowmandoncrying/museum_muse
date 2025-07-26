<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<jsp:include page="../projectHeader.jsp"/>
<jsp:useBean id="dto" class="web.bean.dto.UserDTO" />
<jsp:setProperty name="dto"  property="*" />
<jsp:useBean id="dao" class="web.bean.dao.UserDAO" /> 

<%
	String id = request.getParameter("id");
	String phone = request.getParameter("phone");
	String foundPw = dao.findPwById(id,phone);
	
	if(foundPw != null){
%>
		<h2>찾으신 비밀번호</h2>
		<p>회원님의 비밀번호는<%=foundPw%>입니다.</p>
<%
	}else{
%>		<h2>비밀번호를 찾을 수 없습니다.</h2>
		<p>입력하신 아이디와 휴대폰번호가 일치하는 계정이 없습니다.</p>
<% } %>	

<a href = "loginForm.jsp"><Strong>로그인 바로가기</Strong></a>

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