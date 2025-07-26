<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>    
<jsp:include page="../projectHeader.jsp"/>
<h1>inputPro.jsp</h1>

<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="web.bean.dto.UserDTO" /> 
<jsp:setProperty property="*" name="dto" /> 
<jsp:useBean id="dao" class="web.bean.dao.UserDAO" />

<%
	String birthDate = request.getParameter("birth");
	LocalDate today = LocalDate.now();
	LocalDate birth = LocalDate.parse(birthDate);
	
	if(birth.isAfter(today)){
%>
<script>
	alert("생년월일을 다시 입력해주세요.");
	history.go(-1);
</script>
<%  
    } else {
        String id = dto.getId(); // 아이디 가져오기

        String idRegex = "^[a-zA-Z0-9_]+$"; // 특수문자를 제외한 영문 대소문자, 숫자, 밑줄 허용하는 정규 표현식

        if (!id.matches(idRegex)) { // 정규 표현식과 일치하지 않는 경우
%>
<script>
    alert("아이디에 특수문자를 포함할 수 없습니다.");
    window.history.back(); // 이전 페이지로 이동
</script>
<%
            return; // 여기서 더 이상 진행하지 않도록 리턴
        } // end of if
        
        dao.userInput(dto); // 기존 dto 설정을 유지하면서 회원가입 처리하는 것
%>
<script>
	alert("회원가입이 완료되었습니다.");
	window.location="loginForm.jsp";
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