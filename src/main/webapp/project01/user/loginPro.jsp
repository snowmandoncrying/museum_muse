<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
 <jsp:include page="../projectHeader.jsp"/>
<jsp:useBean id="dto" class="web.bean.dto.UserDTO" />
<jsp:setProperty name="dto"  property="*" />
<jsp:useBean id="dao" class="web.bean.dao.UserDAO" />   

<h1>loginPro.jsp</h1>


<%
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
	}
	if(cid != null && cpw != null && cauto != null){
		dto.setId(cid);
		dto.setPw(cpw);
		dto.setAuto(cauto);
	}

	int result = dao.loginCheck(dto);
	dto.setGrade(dao.loginGrade(dto.getId(), dto.getPw()));

	if(result == 1){
		session.setAttribute("sid", dto.getId());
		session.setAttribute("sgrade", dto.getGrade());
		if(dto.getAuto() != null){
			Cookie cooid = new Cookie("cid", dto.getId());
			Cookie coopw = new Cookie("cpw", dto.getPw());
			Cookie cooauto = new Cookie("cauto", dto.getAuto());
			cooid.setMaxAge(60*60*24);
			coopw.setMaxAge(60*60*24);
			cooauto.setMaxAge(60*60*24);
			cooid.setPath("/project01/");
			coopw.setPath("/project01/");
			cooauto.setPath("/project01/");
			response.addCookie(cooid);
			response.addCookie(coopw);
			response.addCookie(cooauto);
		}
		response.sendRedirect("../home.jsp");
	}else{
%>		<script>
		alert("아이디 또는 비밀번호를 확인하세요.");
		history.go(-1);
		</script>
	<%}
%>
