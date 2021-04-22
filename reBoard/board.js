function check_ok(){
	if(document.bor_frm.b_name.value.length == 0){
		alert("작성자를 입력하세요.");
		bor_frm.b_name.focus();
		return;
	}
	if(document.bor_frm.b_title.value.length == 0){
		alert("제목을 입력하세요.");
		bor_frm.b_title.focus();
		return;
	}
	if(document.bor_frm.b_content.value.length == 0){
		alert("내용을 입력하세요.");
		bor_frm.b_content.focus();
		return;
	}
	if(document.bor_frm.b_pwd.value.length == 0){
		alert("비밀번호를 입력하세요.");
		bor_frm.b_pwd.focus();
		return;
	}
	document.bor_frm.submit();
}

function delete_ok(){
	if(document.form.b_pwd.value.length == 0){
		alert("비밀번호를 입력하세요.");
		form.b_pwd.focus();
		return;
	}
	document.form.submit();
}