
 function writeSave() {
    var id = document.getElementById("id").value;
    var pw = document.getElementById("pw").value;
    var pwRe = document.getElementById("pwRe").value;
    var name = document.getElementById("name").value;
    var birth = document.getElementById("birth").value;
    var phone = document.getElementById("phone").value;
    var gender = document.getElementById("gender").value;


    if (id === "" || pw === "" || pwRe === "" || name === "" || gender === "" || birth === "" || phone === "" ) {
        alert("입력되지 않은 항목이 있습니다.");
        return false;
    }

    if (pw !== pwRe) {
        alert("비밀번호가 일치하지 않습니다.");
        document.getElementById("pwRe").focus();
        return false;
    }
    return true;
  }
    function change(){
	var newPw = document.getElementById("newPw").value;
    var checkPw = document.getElementById("checkPw").value;
    
    if(newPw === "" || checkPw ===""){
		alert("입력되지 않은 항목이 있습니다.");
		return false;
	}
	if(newPw !== checkPw){
		alert("입력하신 비밀번호가 서로 다릅니다.")
		document.getElementById("newPw").focus();
		return false;
	}
	return true;
}
	