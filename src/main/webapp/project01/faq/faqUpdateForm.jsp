<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.bean.dao.FaqDAO" %>
<%@ page import="web.bean.dto.FaqDTO" %>
<jsp:include page="../projectHeader.jsp"/>
<%
	int question_id = Integer.parseInt(request.getParameter("question_id"));
	FaqDAO dao = new FaqDAO();
	FaqDTO dto = dao.getFaqById(Integer.toString(question_id));
%>

<center>FAQ 수정</center>
<form action="faqUpdatePro.jsp" method="post" name="faqUpdateForm" onsubmit="return updateList()">
	<input type="hidden" name="question_id" value="<%=request.getParameter("question_id")%>" /><br/>
	제목 수정: <input type="text" name="question_text" value="<%=request.getParameter("question_text")%>" /><br/>
	내용 수정: <input type="text" name="answer_text" value="<%=request.getParameter("answer_text")%>" /><br/>
		<input type="submit" value="FAQ수정">
		<input type="button" value="돌아가기" OnClick="history.go(-1)">
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