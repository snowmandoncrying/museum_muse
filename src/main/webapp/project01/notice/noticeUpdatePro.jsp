<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.bean.dao.NoticeDAO"%>
<%@ page import="web.bean.dto.NoticeDTO"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="notice" class="web.bean.dto.NoticeDTO" >
</jsp:useBean>

<%	
	int num = Integer.parseInt(request.getParameter("noticeNum"));
	notice.setNotices_num(num);
	notice.setTitle(request.getParameter("title"));
	notice.setContent(request.getParameter("content"));
	notice.setAuthor(request.getParameter("author"));
	
	NoticeDAO dbPro = new NoticeDAO();
	dbPro.updateNotice(notice);
	
	response.sendRedirect("notice.jsp");
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