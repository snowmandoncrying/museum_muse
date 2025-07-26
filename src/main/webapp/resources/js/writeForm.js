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
	  alert("게시일을 설정해주세요.");
	  document.exhibitWriteForm.start_date.focus();
	  return false;
	}
	
	if(document.exhibitWriteForm.end_date.value==""){
	  alert("마감일을 설정해주세요.");
	  document.exhibitWriteForm.end_date.focus();
	  return false;
	}
        
	if(document.exhibitWriteForm.exhibit_time1.value==""
	&&document.exhibitWriteForm.exhibit_time2.value==""
	&&document.exhibitWriteForm.exhibit_time3.value==""
	&&document.exhibitWriteForm.exhibit_time4.value==""){
	  alert("최소 한 개의 전시시간대를 입력하세요.");
	  document.exhibitWriteForm.exhibit_time1.focus();
	  return false;
	}
 }    

