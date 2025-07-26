<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "web.bean.dao.FaqDAO" %>
<%@ page import = "web.bean.dto.FaqDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<jsp:include page="../projectHeader.jsp"/>
<%
	String sgrade = (String)session.getAttribute("sgrade");
	String sid = (String)session.getAttribute("sid");

	int pageSize = 10;
  	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
  	String pageNum = request.getParameter("pageNum");
   
   if(pageNum == null){
      pageNum = "1";
   }
   
   int currentPage = Integer.parseInt(pageNum);
   int startRow = (currentPage - 1) * pageSize + 1;
   int endRow = currentPage * pageSize;
   int count = 0;
   
   List<FaqDTO> faqList = null;
   FaqDAO faqDAO = new FaqDAO();
   count = faqDAO.getFaqCount(); // FAQ의 총 개수를 가져옵니다.
   
   if(count > 0){
      faqList = faqDAO.getFaqList(startRow, endRow); // FAQ 목록을 가져옵니다.
   }
%>
<html>
<head>
<title>FAQ 목록</title>
</head>

<body>
	<b>FAQ 목록 (전체 FAQ:<%=count%>)</b>
 		<table width="700">
    		<tr>
       			<td align="right">
       			<%
       			if(sgrade != null){ 
       		       if(sgrade.equals("관리자")){%>
						 <a href="faqWriteForm.jsp">FAQ 추가</a>   <!-- 관리자만 FAQ를 추가할 수 있도록 수정  -->
       		       	<%}
       		       } %>
       		          
          	</td>
       </tr>
 </table>
<!-- FAQ 목록 표시 --> 
<% if (count == 0){ %>
   <table width="700" border="1" cellpadding="0" cellspacing="0">
      <tr>
         <td align="center">
            저장된 FAQ가 없습니다.
         </td>
      </tr>
   </table>
<% }else { %>
   <table border="1" width="700" cellpadding="0" cellpacing="0" align="center">
      <tr height="30">
         <td align="center" width="50">번호</td>
         <td align="center" width="250">제목</td>
         <td align="center" width="100">작성일</td>
         <td align="center" width="150">작성자</td>
      </tr>
<%--FAQ 목록 출력 --%>      
<% for(FaqDTO faq : faqList) { %>
   <tr height="30">
         <td align="center" width="50"> <%=faq.getQuestion_id()%></td>
         <td width="250">
         	<a href="faqListPro.jsp?question_id=<%=faq.getQuestion_id()%>&Question_text=<%=faq.getQuestion_text()%>"><%=faq.getQuestion_text()%></a></td> 
         <td align="center" width="150"><%=sdf.format(faq.getReg_date())%></td>
         <td align="center" width="150"><%=faq.getWriter() %></td>
   </tr>
<% } %>
</table>
<% } %>
<%--페이지 링크 표시 --%>
<%
   if(count > 0){
      int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
      int startPage = (int)(currentPage / 10)*10+1;
      int pageBlock = 10;
      int endPage = startPage + pageBlock -1;
      
      if(endPage > pageCount) endPage = pageCount;
      if(startPage > 10){ %>
         <a href="faqList.jsp?pageNum=<%=startPage-10%>">[이전]</a>
<%   }
   	  for(int i = startPage; i <= endPage; i++){ %>
      <a href="faqList.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<% }
	  if(endPage < pageCount){ %>               
      <a href="faqList.jsp?pageNum=<%=startPage+10%>">[다음]</a>
<%       }
   }
%>
</body>
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