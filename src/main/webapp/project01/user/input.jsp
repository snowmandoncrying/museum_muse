<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../projectHeader.jsp"/>


<h1>회원가입</h1>

<script language="JavaScript" src="script.js"></script>


<script>
	function validateForm(){
		var birth = document.getElementById("birth").value;
		var today = new Date();
		var birthDate = new Date(birth);
		
		if(birthDate > today){
			alert("생년월일이 오늘 날짜 이후입니다. 다시 입력해주세요.");
			return false;
		}
	}

   function idCheck(){
      id = document.getElementById("id").value;
      if(document.input.id.value==""){
         alert("아이디를 입력하세요.");
         document.input.id.focus();
         return false;
      }
      open("idCheck.jsp?id="+id,"아이디 중복확인","width=300 , height=200");
   }
</script>

<script>
   function showAdminAuthInput() {
	    var adminAuthInput = document.getElementById("adminAuthInput");
	    if (document.getElementById("adminRadio").checked) {
	        adminAuthInput.style.display = "block";
	    } else {
	        adminAuthInput.style.display = "none";
	    }
	}
   
   function hideAdminAuthInput() {
	    var adminAuthInput = document.getElementById("adminAuthInput");
	    adminAuthInput.style.display = "none";
	}
   
   function checkAdminAuth() {
	    var adminAuthInput = document.getElementById("adminAuthNumber").value;
	    if (adminAuthInput === "1111") {
	        return true; // 관리자 인증번호가 맞으면 가입 가능
	    } else {
	        alert("올바른 관리자 인증번호를 입력하세요.");
	        return false; // 관리자 인증번호가 틀리면 가입 불가
	    }
	}
</script>


<form action="inputPro.jsp" method="post" name="input" onsubmit="return writeSave()">

   *아이디: <input type="text" name="id" id="id" maxlength="12" placeholder="아이디를 입력하세요."/> 
        <input type="button" value="ID 중복 확인" onclick="idCheck();"/><br />

   *비밀번호: <input type="password" name="pw" id="pw" maxlength="13" placeholder="비밀번호를 입력하세요."/><br />
   *비밀번호 확인: <input type="password" name="pwRe" id="pwRe"  maxlength="12" placeholder="비밀번호를 입력하세요."/><br />
   
   *이름: <input type="text" name="name" id="name" maxlength="5" placeholder="이름을 입력하세요."/><br />

   *생년월일: <input type="date" name="birth" id="birth"/><br />
   *성별:
       남자<input type="radio" name="gender" id="gender" value="male" /> 
       여자<input type="radio" name="gender" id="gender" value="female" /><br/>
       
   *휴대전화: <input type="tel" name="phone" id="phone" maxlength="11" placeholder="-를 빼고 입력해주세요." /><br/>
      
   주소: <input type="text" name="address" placeholder="거주지 주소" /><br/>
   
   Email: <input type="email" name="email" placeholder="E-Mail 주소" /><br/>

   *회원 유형:
		<input type="radio" name="gradeCheck" value="user" onclick="hideAdminAuthInput()" checked > 일반 회원
		<input type="radio" name="gradeCheck" id="adminRadio" value="admin" onclick="showAdminAuthInput()"> 관리자<br/>
		
		<div id="adminAuthInput" style="display: none;">
		    관리자 비밀번호: <input type="password" name="adminAuthNumber">
		</div>

   <h5> *은 필수 입력 항목입니다.</h5>
   <input type="submit" value="회원가입" onclick="return checkAdminAuth()">
<button type="button" onclick="history.go(-1);">뒤로가기</button>
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