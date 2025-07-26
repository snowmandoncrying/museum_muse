<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="../projectHeader.jsp"/>
<%
	int num = Integer.parseInt(request.getParameter("noticeNum"));
%>
<script language="JavaScript">
	function deleteSave(){
		if(document.delForm.pw.value==''){
			alert("비밀번호를 입력하십시오.");
			document.delForm.pw.focus();
			return false;
		}
	}
</script>
<b>공지삭제</b>
<form method="POST" name="delForm" action="noticeDeletePro.jsp" onsubmit="return deleteSave()">
	비밀번호 : <input type="password" name="pw">
			<input type="hidden" name="noticeNum" value="<%=num%>">
			<input type="submit" value="공지삭제">
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