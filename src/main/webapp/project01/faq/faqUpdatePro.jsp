<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="web.bean.dao.FaqDAO"%>
<%@ page import="web.bean.dto.FaqDTO"%>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="dto" class="web.bean.dto.FaqDTO" />
<jsp:include page="../projectHeader.jsp"/>
<title> FAQ 수정 완료</title>

<%
	int question_id = Integer.parseInt(request.getParameter("question_id"));
	dto.setQuestion_id(question_id);
	dto.setQuestion_text(request.getParameter("question_text"));
	dto.setAnswer_text(request.getParameter("answer_text"));
	
	FaqDAO dao = new FaqDAO();
	dao.updateFaq(dto);
	
	response.sendRedirect("faqList.jsp");
%>
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