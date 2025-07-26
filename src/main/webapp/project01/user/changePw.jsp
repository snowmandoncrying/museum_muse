<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<jsp:include page="../projectHeader.jsp"/>

<h3>비밀번호 변경</h3>
<script language="JavaScript" src="script.js"></script>

<%
   String currentSid = (String)session.getAttribute("sid");
   if(currentSid == null){
%>
      <p>로그인 후 이용가능합니다.</p>
      
  <%} else { %>
      <form action="changepwPro.jsp" method="post" onsubmit="return change()">
         <label for="currentPw">현재 비밀번호</label>
         <input type="password" id="pw" name="pw"><br/>
         
         <label for="newPw">변경할 비밀번호</label>
         <input type="password" id="newPw" name="newPw"><br/>
         
         <label for="checkPw">변경할 비밀번호 확인</label>
         <input type="password" id="checkPw" name="checkPw"><br/>
         
         <input type="submit" value="변경">
      </form>
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