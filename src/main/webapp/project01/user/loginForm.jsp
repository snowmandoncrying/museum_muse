<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../projectHeader.jsp"/>
<%
	String sid = (String)session.getAttribute("sid");
	if(sid == null){
		Cookie [] cookies = request.getCookies();
		String cid=null, cpw=null, cauto=null;
		if(cookies != null){
			for(Cookie c : cookies){
				if(c.getName().equals("cid")){
					cid = c.getValue();
				}
				if(c.getName().equals("cpw")){
					cpw = c.getValue();
				}
				if(c.getName().equals("cauto")){
					cauto = c.getValue();
				}
			}
			if(cid != null && cpw != null && cauto != null){
				response.sendRedirect("loginPro.jsp");
			}
		}
	}
%>


<form action="loginPro.jsp" method="post">
	아이디 : <input type="text" name="id" /> <br/>
	비밀번호 : <input type="password" name="pw" /> <br/>
	자동로그인 : <input type="checkbox" name="auto" value="1"/><br/>
		 <input type="submit" value="login" />
</form>

<a href="input.jsp">회원가입</a>&nbsp;|
<a href="findId.jsp">아이디 찾기</a>&nbsp;|
<a href="findPw.jsp">비밀번호 찾기</a>
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