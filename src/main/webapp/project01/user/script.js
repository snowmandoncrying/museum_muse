function writeSave() {
    var id = document.getElementById("id").value;
    var pw = document.getElementById("pw").value;
    var pwRe = document.getElementById("pwRe").value;
    var name = document.getElementById("name").value;
    var birth = document.getElementById("birth").value;
    var phone = document.getElementById("phone").value;
    var gender = document.getElementById("gender").value;

    if (id === "" || pw === "" || pwRe === "" || name === "" || gender === "" || birth === "" || phone === ""  ) {
        alert("입력되지 않은 항목이 있습니다.");
        return false;
    }

// 아이디에만 특수문자 포함 여부를 검사하는 정규 표현식
    var idRegex = /^[a-zA-Z0-9_]+$/;

    if (!idRegex.test(id)) {
        alert("아이디에 특수문자를 포함할 수 없습니다.");
        return false;
    }
	
    if (pw !== pwRe) {
        alert("비밀번호가 일치하지 않습니다.");
        document.getElementById("pwRe").focus();
        return false;
    }
    
    if(id.length < 2 || id.length > 12){
		alert("아이디는 2~12글자까지 가능합니다.")
		return false;
	}
	
	if(pw.length < 4 || pw.length > 13){
		alert("비밀번호설정은 4~13자리까지 가능합니다.")
		return false;
	}
	
	if(name.length < 2 || name.length > 5){
		alert("이름은 2~5글자로 입력하세요.")
		return false;
	}
	
	if(phone.length !== 11){
		alert("전화번호는 -를제외한 11자리를 입력해주세요.")
		return false;
	}
    return true;
}

function validateSpecialCharacters() {
		var id = document.forms["input"]["id"].value;	// 폼 이름: input, 그 안에 있는 id 필드 값을 가져옴
		var regex = /^[a-zA-Z0-9_]+$/;	// 알파벳 대소문자, 숫자, 밑줄만 허용하는 정규 표현식임
		if(!regex.test(id)) {	// 아이디가 정규 표현식과 일치하지 않는 경우 경고 메세지 표시
			alert("아이디에 특수문자를 포함할 수 없습니다.");
			return false;
		}
	}

function change(){
	var newPw = document.getElementById("newPw").value;
	var checkPw = document.getElementById("checkPw").value;
	
	if (newPw === "" || checkPw === "" ) {
        alert("입력되지 않은 항목이 있습니다.");
        return false;
    }
	
	if(newPw !== checkPw){
		alert("변경된 비밀번호가 서로 다릅니다.");
		document.getElementById("newPw").focus();
		return false;
	}
	return true;
}

function adminWriter(){
	if(document.writeform.question_id.value==""){
	  alert("제목을 입력하세요.");
	  document.writeform.question_id.focus();
	  return false;
	}
	
	if(document.writeform.question_text.value==""){
	  alert("내용을 입력하세요.");
	  document.writeform.question_text.focus();
	  return false;
	}
}