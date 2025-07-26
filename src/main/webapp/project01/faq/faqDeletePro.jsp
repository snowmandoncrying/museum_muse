<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.bean.dao.FaqDAO" %>
<jsp:include page="../projectHeader.jsp"/>
<% request.setCharacterEncoding("UTF-8");%>

<%
	int id = Integer.parseInt(request.getParameter("question_id"));
	//Form 페이지에있는 name = questionId의 파라미터 받아오기
	String pw = request.getParameter("pw");
	//Form 페이지에있는 name = pw의 파라미터 받아오기
	String sid = (String)session.getAttribute("sid");
	//세션에 저장되어있는 아이디를 꺼내오기
	
	FaqDAO dao = new FaqDAO();
	int i = dao.deleteFaq(id,pw,sid);
	
	if(i==0){
%>	<script>
		alert("등록하신 Faq가 삭제되었습니다.");<%-- 정상적으로 비밀번호를 입력하면 띄울 문구. --%>
		window.location='faqList.jsp'; <%-- Faq 삭제가 완료되면 다시 리스트로 돌아감. --%>
	</script>
<% }else{
%>	<script>
		alert("비밀번호를 확인하세요."); <%-- 비밀번호가 틀렸을경우 띄울 알람. --%>
		history.go(-1); <%-- 잘못되었을경우 재입력하기위해 비밀번호 입력창으로 돌아감.--%>
	</script>
<% }  %>
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