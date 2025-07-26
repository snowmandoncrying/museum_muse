<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.bean.dao.BoardDAO"%>
<%@ page import="web.bean.dto.BoardDTO"%>
<jsp:include page="../projectHeader.jsp"/>
       <div style="text-align : right; font-size : 15px;">
<%
	String sgrade = (String)session.getAttribute("sgrade");	
	if(sgrade != null ){
		if(sgrade.equals("관리자")){
%>			<a href="admin/reservationManagement.jsp">예약관리</a>
			<a href="exhibit/exhibitWriteForm.jsp">글쓰기</a>	

<% 		}else{
%>			<a href="book/bookingInquiry.jsp">예약조회</a>
<% 		}
%>	    <a href="user/myPage.jsp">마이페이지</a>
    	<a href="user/logout.jsp">로그아웃</a>
 <% }else{
 %>    	 <a href="user/input.jsp">회원가입</a>
    	 <a href="user/loginForm.jsp">로그인</a>
<%  }%>   	       
        <a href="notice/notice.jsp">공지사항</a>
        <a href="faq/faqList.jsp">자주 묻는 질문</a>
    </div>
<title>작품 전시</title>
    <div class="logo-container">
        <a href="home.jsp">
            <img class="logo" src="../resources/image/logo.png" alt="로고">
        </a>
    </div>
    <script language="JavaScript" src="writeForm.js"></script>
<%
	int num = Integer.parseInt(request.getParameter("exhibit_number"));
	BoardDAO dbPro = new BoardDAO();
	BoardDTO exhibit = dbPro.getExhibit(num);
%>
<center><b>글수정</b><br>
   <form method="post" enctype="multipart/form-data" name="exhibitWriteForm" 
   action="exUpdatePro.jsp?exhibit_number=<%=num%>" onsubmit="return writeSave()">   
      <table width="420" border="1" cellspacing="0" cellpadding="0" align="center" >
      <input type="hidden" name="exhibit_number" value="<%=num%>"/>
          <tr>
            <td width="70" align="center">제목</td>
            <td width="330">
               <input type="text" size="40" maxlength="50" name="exhibit_name" value="<%=exhibit.getExhibit_name()%>">
            </td>
         </tr>
         <tr>
            <td width="70" align="center">작가</td>               
            <td width="330">
               <input type="text" size="10" maxlength="10" name="author_name" value="<%=exhibit.getAuthor_name()%>">
            </td>
         </tr>
         <tr>
            <td width="70" align="center">전시 포스터</td>
            <td width="330" id="upload">
               <input type="file" name="upload">
            </td>
         </tr>
         <tr >
            <td width="120" align="center">작품 내용</td>
            <td width="330">
               <textarea name="exhibit_content" rows="13" cols="40"><%=exhibit.getExhibit_content()%></textarea>
            </td>
         </tr>
         <tr>
            <td width="200" align="center">전시 시작일</td>
            <td width="330">
               <input type="date" size="10" name="start_date">
            </td>
         </tr>
         <tr>
            <td width="200" align="center">전시 마감일</td>
            <td width="330">
               <input type="date" size="10" name="end_date">
            </td>
         </tr>
         <tr>
            <td width="70" align="center">관람 등급</td>
            <td width="330">
               <input type="radio" name="exhibit_grade" value="전체관람" checked="checked"/>전체 관람
               <input type="radio" name="exhibit_grade" value="성인관람"/>성인 관람
            </td>
         </tr>   
         <tr>
            <td width="70" align="center">시간대</td>
            <td width="330">
               1타임<input type="text" name="exhibit_time1" placeholder="HH:MM-HH:MM" value="<%=exhibit.getExhibit_time1()%>"/><br/>
               2타임<input type="text" name="exhibit_time2" placeholder="HH:MM-HH:MM" value="<%=exhibit.getExhibit_time2()%>"/><br/>
               3타임<input type="text" name="exhibit_time3" placeholder="HH:MM-HH:MM" value="<%=exhibit.getExhibit_time3()%>"/><br/>
               4타임<input type="text" name="exhibit_time4" placeholder="HH:MM-HH:MM" value="<%=exhibit.getExhibit_time4()%>"/>
            </td>
         </tr>      
         <tr>
            <td colspan=2 align="center">
               <input type="submit" value="수정완료"> <input type="reset" value="다시작성">
               <input type="button" value="돌아가기" OnClick="history.go(-1)">
            </td>
         </tr>   
            
            
            
         </table>
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