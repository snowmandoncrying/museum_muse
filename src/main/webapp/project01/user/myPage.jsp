<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:include page="../projectHeader.jsp"/>
<jsp:useBean id="dao" class="web.bean.dao.UserDAO" /> 
<jsp:useBean id="dto" class="web.bean.dto.UserDTO" />

<h1>마이페이지</h1>
 
<% 
    String id = (String) session.getAttribute("sid"); 
    dto = dao.user(id);
    
    if(dto != null){
%>    

<h4>아이디 : <%=dto.getId()%></h4>
<h4>이름 : <%=dto.getName()%></h4>
<h4>전화번호 : <%=dto.getPhone()%></h4>
<h4>생년월일 : <%=dto.getBirth()%></h4>
<h4>회원가입일 : <%=dto.getReg()%></h4>

<button onclick="window.location='changePw.jsp'">비밀번호 수정</button>
<button onclick="window.location='delete.jsp'">회원 탈퇴</button>


<% }else{%>
   <p>사용자의 정보를 가져올 수 없습니다.</p>
<% } %>
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