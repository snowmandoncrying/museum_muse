<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.bean.dao.BoardDAO" %>
<%@ page import="web.bean.dto.BoardDTO" %>
<%@ page import="web.bean.dao.UserDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.File" %>
<jsp:include page="../projectHeader.jsp"/>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	int num = Integer.parseInt(request.getParameter("exhibitNumber"));

	String sid = (String)session.getAttribute("sid");
	String pw = request.getParameter("adminAuthNumber");
	
	BoardDAO dbPro = new BoardDAO();
	BoardDTO exhibit = dbPro.getExhibit(num);
	int fileNames = dbPro.deleteExhibit(num, sid, pw);

	
	if(fileNames == 0){
		String path = request.getRealPath("/project01/upload");
			File f = new File(path+"/"+exhibit.getExhibit_img());
			f.delete();	
%>				<script>
					alert("삭제되었습니다.");
					window.location="../home.jsp";				
				</script>			
<% 		}else{
%>				<script>
					alert("비밀번호를 다시 입력해주세요.")
					history.go(-1);
				</script>
<% }%>	
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