<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "web.bean.dao.NoticeDAO" %>
<%@ page import = "web.bean.dto.NoticeDTO" %>
<%@ page import = "java.util.List" %>
<%
	String sgrade = (String)session.getAttribute("sgrade");

	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage -1)* pageSize +1;
	int endRow = currentPage * pageSize;
	int count = 0;
	List noticeList = null;
	NoticeDAO dbPro = new NoticeDAO();
	count = dbPro.getNoticeCount();
	if(count>0){
		noticeList = dbPro.getNotices(startRow,endRow);
	}
%>
<jsp:include page="../projectHeader.jsp"/>
<%
       			if(sgrade != null){ 
       		       if(sgrade.equals("관리자")){%>
						 <a href="noticeWriteForm.jsp">공지작성</a><hr>   <!-- 관리자만 FAQ를 추가할 수 있도록 수정  -->
       		       	<%}
       		       }
%>
        <%if(count==0){ %>
	현재 공지사항이 없습니다.
<%}else{ 
	for(int i = 0 ; i < noticeList.size();i++){
		NoticeDTO notice = (NoticeDTO)noticeList.get(i);
	%>
	<a href="noticeContent.jsp?notices_num=<%=notice.getNotices_num()%>&pageNum=<%=currentPage%>">
		<%=notice.getTitle() %>
	</a><br/>
<%}
} %>
<%
	if(count >0){
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = (int)(currentPage/10)*10+1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount) endPage = pageCount;
		if(startPage > 10){
%>			<a href="notice.jsp?pageNum=<%= startPage-10 %>">[이전]</a>
<%		}
		for (int i = startPage ; i<= endPage ; i++){
%>			<a href="notice.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%		}
		if(endPage < pageCount){
%>			<a href="notice.jsp?pageNum=<%= startPage+10 %>">[다음]</a>
<%		}
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
