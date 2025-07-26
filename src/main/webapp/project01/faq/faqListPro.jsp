<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.bean.dao.FaqDAO" %>
<%@ page import="web.bean.dto.FaqDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<jsp:include page="../projectHeader.jsp"/>
<%
	String question_id = request.getParameter("question_id"); // FAQ의 질문 ID를 받아옴
	FaqDAO faqDAO = new FaqDAO();	// FAQ의 내용을 DB에서 가져옴
	FaqDTO faq = faqDAO.getFaqById(question_id);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ 내용</title>
</head>
<body>

    <h1>FAQ 내용</h1>
    <p><b>제목:</b> <%= faq.getQuestion_text() %></p>
    <p><b>내용:</b> <%= faq.getAnswer_text() %></p>
    <p><b>등록일:</b> <%= faq.getReg_date() %></p>
    <p><b>작성자:</b> <%= faq.getWriter() %></p>
</body>
</html>

<%
String sgrade = (String)session.getAttribute("sgrade");
if(sgrade != null){ 
       if(sgrade.equals("관리자")){%>
<a href ="faqUpdateForm.jsp?question_id=<%=question_id%>" >글수정</a>
<a href="faqDeleteForm.jsp?question_id=<%=question_id%>">글삭제</a>
		<%}
}%>

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