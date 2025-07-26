<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../projectHeader.jsp"/>
<%

	session.removeAttribute("sid");
	session.invalidate();
	
	//로그아웃시 쿠키 삭제
	Cookie [] cookies = request.getCookies();
	String cid=null, cpw=null, cauto=null;
	if(cookies != null){
		for(Cookie c : cookies){
			if(c.getName().equals("cid")){
				c.setMaxAge(0);
				c.setPath("/project01/");
				response.addCookie(c);
			}
			if(c.getName().equals("cpw")){
				c.setMaxAge(0);
				c.setPath("/project01/");
				response.addCookie(c);
			}
			if(c.getName().equals("cauto")){
				c.setMaxAge(0);
				c.setPath("/project01/");
				response.addCookie(c);
			}
		}
	}
	
	response.sendRedirect("loginForm.jsp");
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