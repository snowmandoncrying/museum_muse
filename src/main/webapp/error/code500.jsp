<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h1>ERROR CODE : 500</h1>
<h1>죄송합니다. 요청하신 페이지를 준비 중입니다.  카리나보고 봐주세요 :)</h1>
<%
	// 톰캣 서버로부터 응답을 받는다.
	// HttpServletResponse.SC_OK == 정상 처리
	// 정상 코드 == 200
	response.setStatus(HttpServletResponse.SC_OK);
%>
<img src="/project01/resources/image/500.jpg">
