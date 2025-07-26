<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1> ID 중복 확인</h1>
<jsp:useBean id="dao" class="web.bean.dao.UserDAO" />

<%
	String id = request.getParameter("id");
	int result = dao.idCheck(id);
	if(result == 0){
%>		<h2>[<%=id%>]사용 가능한 ID입니다.</h2>
<%	}else{
%>		<h2>[<%=id%>]중복된 ID입니다.</h2>
		<form action="idCheck.jsp">
			id : <input type="text" name="id" /><br />
				 <input type="submit" value="중복확인" />
		</form>	
<% } %>
<br />
<button onclick="selfClose()">닫기</button>

<script>
	function selfClose(){
		opener.document.getElementById("id").value = "<%=id%>";
		self.close();
	}

</script>
