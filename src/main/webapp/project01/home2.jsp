<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "web.bean.dao.BoardDAO" %>
<%@ page import = "web.bean.dto.BoardDTO" %>
<%@ page import = "java.util.List" %>
<!doctype html>
<%
	String sid = (String)session.getAttribute("sid");
	String sgrade = (String)session.getAttribute("sgrade");	
	
	
	if(sid == null){
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
			if(cid != null && cpw != null && cauto != null){
				response.sendRedirect("/project01/project01/user/loginPro.jsp");
			}
		}
	}

	int pageSize = 5;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage -1)* pageSize +1;
	int endRow = currentPage * pageSize;
	int count = 0;
	List exhibitList = null;
	BoardDAO dbPro = new BoardDAO();
	count = dbPro.getExhibitCount();
	if(count>0){
		exhibitList = dbPro.getExhibits(startRow,endRow);
	}
	
%>
<jsp:include page="projectHeader.jsp"/>
<main>

  <section class="py-5 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
        <h1 class="fw-light">10분만 쉬조</h1>
        <p class="lead text-body-secondary">css가 너무 어려워용</p>
      </div>
    </div>
  </section>

  <div class="album py-5 bg-body-tertiary">
    <div class="container">
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <%if(count==0){ %>
			현재 전시중인 작품이 없습니다.
<%		}else{ 
			for(int i = 0 ; i < exhibitList.size();i++){
			BoardDTO exhibit = (BoardDTO)exhibitList.get(i);
%>			<div class="col">
	          <div class="card shadow-sm">
					<img width="100%" height="500" src="/project01/project01/upload/<%=exhibit.getExhibit_img()%>">
	            <div class="card-body">
	            	<p class="card-text"><%=exhibit.getExhibit_name() %></p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" class="btn btn-sm btn-outline-secondary" onclick="window.location='content.jsp?exhibit_number=<%=exhibit.getExhibit_number()%>'">자세히 보기</button>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
<%			}
		}
%>
      </div>
    </div>
  </div>

</main>

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
