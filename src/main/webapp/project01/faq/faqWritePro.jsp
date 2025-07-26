<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "web.bean.dao.FaqDAO" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="faqList" class="web.bean.dto.FaqDTO"/>
<jsp:include page="../projectHeader.jsp"/>

    <%  
        		// 폼에서 전송된 데이터 받기
        faqList.setQuestion_text(request.getParameter("question_text"));
        faqList.setAnswer_text(request.getParameter("answer_text"));
		faqList.setWriter(request.getParameter("writer"));
		
		FaqDAO dao = new FaqDAO(); // 객체 생성
		dao.insertfaqList(faqList);  // 메서드 호출
		
			// 받은 데이터 출력 (실제로는 여기서 데이터베이스에 저장하는 등의 작업을 수행해야 함)
         response.sendRedirect("faqList.jsp");
    %>
    