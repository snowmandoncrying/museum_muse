<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sgrade = (String)session.getAttribute("sgrade");	
%>

<nav class="navbar bg-body-tertiary">
  <div class="container-fluid" style="display: flex; justify-content: flex-end;">
<%
	if(sgrade != null ){
		if(sgrade.equals("관리자")){  
%>   		 <a class="navbar-brand" href="../admin/reservationManagement.jsp">예약관리</a>&nbsp;
  		     <a class="navbar-brand" href="../exhibit/exhibitWriteForm.jsp">글쓰기</a>&nbsp;
<% 		}else{  		     
%>   		 <a class="navbar-brand" href="../book/bookingInquiry.jsp">예약조회</a>&nbsp;
<% 		}
%>   		 <a class="navbar-brand" href="../user/myPage.jsp">마이페이지</a>&nbsp;
  	 		 <a class="navbar-brand" href="../user/logout.jsp">로그아웃</a>&nbsp;
 <% }else{   
 %>   		<a class="navbar-brand" href="../user/input.jsp">회원가입</a>&nbsp;
   			<a class="navbar-brand" href="../user/loginForm.jsp">로그인</a>&nbsp;
<%  }%>    
   		    <a class="navbar-brand" href="../notice/notice.jsp">공지사항</a>&nbsp;
    	    <a class="navbar-brand" href="../faq/faqList.jsp">자주 묻는 질문</a>&nbsp;
  </div>
</nav>

<html>
<head>
	<meta charset="UTF-8">
    <title>오시는 길</title>
    <style>
    	 body {
            margin: 0;
            padding: 0;
            background-image: url('../../resources/image/home.jpg');
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
        .map-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 70vh; /* 화면 높이를 꽉 채우도록 설정 */
        }
        iframe {
            border: 0;
        }
        h1 {
            text-align: center; /* 가운데 정렬 */
            color: white; /* 텍스트 색상 */
            margin-top: 200px; /* 위아래 여백 (여기서 조정) */
            margin-left: -500px; /* 왼쪽 여백 (여기서 조정) */
            font-size: 3em; /* 글자 크기 */
            z-index: 1000; /* 다른 요소 위에 나타나도록 설정 */
            position: relative; /* 상대적 위치 */
        }
        .naverMap {
            max-width: 50px; /* 최대 너비를 설정 */
            height: auto; /* 높이는 자동으로 조정 */
            position: fixed; /* 고정 위치 설정 */
            bottom: 10px; /* 아래쪽 간격 조정 */
            right: 10px; /* 오른쪽 간격 조정 */
        }
    </style>
</head>
<body>
	<h1>오시는 길</h1>
    <div class="map-container">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3166.144794055931!2d126.94952077661311!3d37.48090937206102!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c9f660dc1a8e5%3A0xe9d099e33e1115b8!2z6riA66Gc67KM7JWE7J207Yuw7J247J6s6rCc67Cc7JuQ!5e0!3m2!1sko!2skr!4v1715912259631!5m2!1sko!2skr" 
        width="50%" height="500" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>        
    </div>
     <!-- 배경 이미지 불투명도 조절 -->
    <div class="background-overlay"></div>

    <!-- 로고 -->
    <div class="logo-container">
        <a href="../home.jsp">
            <img class="logo" src="../../resources/image/logo.png" alt="로고">
        </a>
    </div>

    <div style="text-align : right; font-size : 15px;"></div>
    <a href="https://naver.me/GpJLeyQp">
    	<img class="naverMap" src="../../resources/image/map.png" alt="네이버 지도">
    </a>
</body>
</html>
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
