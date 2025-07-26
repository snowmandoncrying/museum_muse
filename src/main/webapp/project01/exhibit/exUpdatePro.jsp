<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.bean.dao.BoardDAO"%>
<%@ page import="web.bean.dto.BoardDTO"%>
<%@ page import="web.bean.dto.UserDTO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.io.File" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="exhibit" class="web.bean.dto.BoardDTO"/>
<jsp:include page="../projectHeader.jsp"/>
<%
	String path = application.getRealPath("/project01/upload");
	String enc = "UTF-8";
	int max = 1024*1024*100;
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,path,max,enc,dp);
	
	exhibit.setExhibit_number(Integer.parseInt((mr.getParameter("exhibit_number"))));
	exhibit.setExhibit_name(mr.getParameter("exhibit_name"));
	exhibit.setAuthor_name(mr.getParameter("author_name"));
	exhibit.setExhibit_content(mr.getParameter("exhibit_content"));
	exhibit.setExhibit_grade(mr.getParameter("exhibit_grade"));
	exhibit.setExhibit_time1(mr.getParameter("exhibit_time1"));
	exhibit.setExhibit_time2(mr.getParameter("exhibit_time2"));
	exhibit.setExhibit_time3(mr.getParameter("exhibit_time3"));
	exhibit.setExhibit_time4(mr.getParameter("exhibit_time4"));
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date startDate = sdf.parse(mr.getParameter("start_date"));
	Date endDate = sdf.parse(mr.getParameter("end_date"));
	exhibit.setStart_date(new Timestamp(startDate.getTime()));
	exhibit.setEnd_date(new Timestamp(endDate.getTime()));
	Timestamp currentTime = new Timestamp(System.currentTimeMillis());
	BoardDAO dbPro = new BoardDAO();
	BoardDTO boardDTO = dbPro.getExhibit(Integer.parseInt((mr.getParameter("exhibit_number"))));
	
	File ff = new File(path+"//"+boardDTO.getExhibit_img());
	ff.delete();
	
	if(startDate.getTime() > endDate.getTime()){
%>		<script>
			alert("게시일보다 마감일이 빠를 수 없습니다.");
			history.go(-1);
		</script>		
<%	}else{
		String sysName = mr.getFilesystemName("upload");
		String type = mr.getContentType("upload");
		if(type==null){
			exhibit.setExhibit_img("noimage.png");
			dbPro.updateExhibit(exhibit);
			response.sendRedirect("../home.jsp");
		}else{
			type=type.split("/")[0];
			if(type.equals("image")){
				exhibit.setExhibit_img(sysName);
				dbPro.updateExhibit(exhibit);
				response.sendRedirect("../home.jsp");
			}else{
				File f = new File(path+"//"+sysName);
				f.delete();
%>				<script>
					alert("사진만 등록 가능합니다.");
					history.go(-1);
				</script>
<%			}
		}
	}
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