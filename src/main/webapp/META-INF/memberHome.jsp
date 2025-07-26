<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "web.bean.dao.BoardDAO" %>
<%@ page import = "web.bean.dto.BoardDTO" %>
<%@ page import = "java.util.List" %>
<%
	int pageSize = 10;
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
<head>
    <meta charset="UTF-8">
    <title>MUSEUM PROJECT HOME</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: url('../resources/image/home.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            height: 100vh; /* 화면의 높이에 맞게 배경 이미지를 늘리기 위해 설정 */
            position: relative; /* 로고를 포함한 요소들의 위치를 상대적으로 설정하기 위해 */
        }
        /* 배경 이미지 불투명도 조절 */
        .background-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* 검은색, 투명도 50% */
            z-index: -1; /* 배경 이미지 뒤에 나타나도록 설정 */
        }
        /* 로고 스타일 */
        .logo-container {
            position: absolute; /* 로고를 절대적으로 위치시키기 위해 */
            top: 5%; /* 화면 세로 중앙에 로고 위치 */
            left: 50%; /* 화면 가로 중앙에 로고 위치 */
            transform: translateX(-50%); /* 로고를 정확히 가로 중앙에 정렬 */
            z-index: 999; /* 다른 요소 위에 나타나도록 설정 */
        }
        .logo {
            display: block;	
            width: 200px; /* 로고의 너비 */
            height: auto; /* 높이 자동 조정 */
        }
        .exhibit-info {
            position: absolute; /* 로고를 절대적으로 위치시키기 위해 */
            top: 50%; /* 화면 세로 중앙에 로고 위치 */
            left: 50%; /* 화면 가로 중앙에 로고 위치 */
            transform: translateX(-50%); /* 로고를 정확히 가로 중앙에 정렬 */
            z-index: 999; /* 다른 요소 위에 나타나도록 설정 */
        }
    </style>
</head>

<style>
	body {
		color: white;
	}
	a {
		color: white;
		text-decoration: none;
	}
	exhibitList {
		position: absolute;
		top: 50;
		left: 50;
		transform: translateX(-50%);
	}
</style>

<body>
    <!-- 배경 이미지 불투명도 조절 -->
    <div class="background-overlay"></div>

    <!-- 로고 -->
    <div class="logo-container">
        <a href="home2.jsp">
            <img class="logo" src="../resources/image/logo.png" alt="로고">
        </a>
    </div>

    <div style="text-align : right; font-size : 16px;">
    	<a href="exhibitWriteForm.jsp">전시 추가</a>
    	<a href="mypage.jsp">마이페이지</a>
    	<a href="loginoutForm.jsp">로그아웃</a>
    </div>
    <hr>
    
    <div style="text-align : right; font-size : 20px;">
        <a href="notice.jsp">공지사항</a>
        <a href="faq.jsp">자주 묻는 질문</a>
        <a href="map.jsp">오시는 길</a>
    </div>
    <hr>

    <div class="exhibit-info">
        <%if(count==0){ %>
			현재 진행 중인 전시가 없습니다.
		<%}else{ 
			for(int i = 0 ; i < exhibitList.size();i++){
			BoardDTO exhibit = (BoardDTO)exhibitList.get(i);
		%>
		<a href="content.jsp?exhibit_number=<%=exhibit.getExhibit_number()%>" class="exhibitList">
			<img src="noimage.png">
		</a>
	</div>
<%}
} %>
</body>
