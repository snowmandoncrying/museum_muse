<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "web.bean.dao.BookDAO" %>
<%@ page import = "web.bean.dto.BookDTO" %>
    <jsp:include page="../projectHeader.jsp"/>
    
 <% 
 	String sid = (String)session.getAttribute("sid");
 	int count = 0;
 	BookDAO dbPro = new BookDAO();
	count = dbPro.getReservationCount(sid);
 %>

<h2>회원 탈퇴</h2>
<h3>비밀번호 확인 절차가 필요합니다.</h3>

<form action="deletePro.jsp" method="post" onsubmit="return deleteCheck()" >
	비밀번호: <input type="password" name="pw" /><br/>
		<%if(count>0){%>
		*회원님의 명의로 예약된 전시가 있습니다. 정말로 탈퇴하시겠습니까? 동의 <input type="checkbox" id="check" name="check" value="check"><br>
<%	}%>
			<input type="submit" value="회원탈퇴" />	
</form>
<script>
function deleteCheck() {
    // 체크박스 요소 가져오기
    var check = document.getElementById('check');
    
    // 체크박스가 존재하고 체크되지 않았는지 확인
    if (check && !check.checked) {
        alert("회원님의 명의로 예약된 전시가 있습니다. 탈퇴를 원하시면 동의에 체크해 주세요.");
        return false;
    }
    
    // 모든 조건이 만족되면 폼 제출 진행
    return true;
}
</script>
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