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

<jsp:include page="../projectHeader.jsp"/>
    
    
    
<%
    int num = Integer.parseInt(request.getParameter("reservation_id"));
%>

<b>예약 취소</b>
	<form action="bookCanclePro.jsp" method="post">
		환불 계좌 : <select name="wallet" id="wallet" >
            <option value="국민은행">기업은행</option>
            <option value="신한은행">국민은행</option>
            <option value="신한은행">신한은행</option>
            <option value="신한은행">하나은행</option>
            <option value="신한은행">우리은행</option>
            <option value="신한은행">카카오</option>
            </select>
            <input type="text" name="wallet_number"><br>
		회원 비밀번호 : <input type="password" name="pw"><br>
		<input type="hidden" name="reservation_id" value="<%=num%>"> 
		<input type="submit" value="예약 취소">
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



