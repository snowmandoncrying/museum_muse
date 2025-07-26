<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../projectHeader.jsp"/>
<h1>FAQ 작성</h1>

<% 
	String sid =(String)session.getAttribute("sid"); // 글쓰기 자체가 admin만 가능할거니까 세션에서 아이디를 가져옴
%>
    <form action="faqWritePro.jsp" method="post">
    	작성자 <%=sid%>
    	<input type="hidden" name="writer" value="<%=sid%>" /></br> 	<!-- 우리가 넣어줘야하는 값 : 그래서 value가 들어가야함 --> 
    	제목 <input type="text" name="question_text"/></br> <!-- 사용자가 입력한걸로 -->
    	내용 <input type="text" name="answer_text"/></br> <!-- 텍스트에어리어로 내용 많으니까 -->
		<input type="submit" value="글작성" />
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