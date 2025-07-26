writeForm.js
function writeSave(){
	if(document.exhibitWriteForm.author_name.value==""){
	  alert("작가명을 입력하세요.");
	  document.exhibitWriteForm.author_name.focus();
	  return false;
	}
	if(document.exhibitWriteForm.exhibit_name.value==""){
	  alert("제목 입력하세요.");
	  document.exhibitWriteForm.exhibit_name.focus();
	  return false;
	}
	
	if(document.exhibitWriteForm.exhibit_content.value==""){
	  alert("내용을 입력하세요.");
	  document.exhibitWriteForm.exhibit_content.focus();
	  return false;
	}
        
	if(document.exhibitWriteForm.start_date.value==""){
	  alert("전시 시작일을 선택하세요.");
	  document.exhibitWriteForm.start_date.focus();
	  return false;
	}
	
	if(document.exhibitWriteForm.end_date.value==""){
	  alert("전시 마감일을 선택하세요.");
	  document.exhibitWriteForm.end_date.focus();
	  return false;
	}
	
	if(document.exhibitWriteForm.exhibit_grade.value==""){
	  alert("관람 등급을 선택하세요.");
	  document.exhibitWriteForm.exhibit_grade.focus();
	  return false;
	}
	
	if(document.exhibitWriteForm.exhibit_time1.value==""||
	document.exhibitWriteForm.exhibit_time2.value==""||
	document.exhibitWriteForm.exhibit_time3.value==""||
	document.exhibitWriteForm.exhibit_time4.value==""
	){
	  alert("시간대를 입력하세요.");
	  if (document.exhibitWriteForm.exhibit_time1.value=="") {
	       form.exhibit_time1.focus();
	   } else if (document.exhibitWriteForm.exhibit_time2.value=="") {
	       form.exhibit_time2.focus();
	   } else if (document.exhibitWriteForm.exhibit_time3.value=="") {
	       form.exhibit_time3.focus();
	   } else if (document.exhibitWriteForm.exhibit_time4.value=="") {
	       form.exhibit_time4.focus();
	   }
	  return false;
	}
	
	const form = document.exhibitWriteForm;
    const timePattern = /^([01]\d|2[0-3]):([0-5]\d)-([01]\d|2[0-3]):([0-5]\d)$/;

    const time1 = form.exhibit_time1.value;
    const time2 = form.exhibit_time2.value;
    const time3 = form.exhibit_time3.value;
    const time4 = form.exhibit_time4.value;

    if (!time1.match(timePattern) || !time2.match(timePattern) || !time3.match(timePattern) || !time4.match(timePattern)) {
        alert("시간대를 'HH:MM-HH:MM' 형식으로 입력하세요.");
        
        if (!time1.match(timePattern)) {
            form.exhibit_time1.focus();
        } else if (!time2.match(timePattern)) {
            form.exhibit_time2.focus();
        } else if (!time3.match(timePattern)) {
            form.exhibit_time3.focus();
        } else if (!time4.match(timePattern)) {
            form.exhibit_time4.focus();
        }
        
        return false;
    }
 }    