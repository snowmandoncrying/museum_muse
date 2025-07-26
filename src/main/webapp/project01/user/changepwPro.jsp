<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:include page="../projectHeader.jsp"/>
<jsp:useBean id="dto" class="web.bean.dto.UserDTO" />
<jsp:setProperty name="dto"  property="*" />
<jsp:useBean id="dao" class="web.bean.dao.UserDAO" /> 

   <title>비밀번호 변경완료</title>
   
<%
   String id = (String)session.getAttribute("sid");  // 로그인된 ID 꺼내기 
   int result = dao.Pw(dto.getPw(),id, dto.getNewPw()); // dao 안에있는  pw,id,newPw꺼내오기
   
   if(result == 1){
%>   <script>
      alert("비밀번호가 변경되었습니다.");
      window.location="logout.jsp";
   </script>
<%   }else{
%>      <script>
         alert("비밀번호를 확인하세요.");
         history.go(-1);
      </script>
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
   