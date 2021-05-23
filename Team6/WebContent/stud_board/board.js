function check_ok(){
	if(document.form.bs_name.value.length == 0){
		alert("이름을 입력하세요.");
		form.bs_name.focus();
		return;
	}
	if(document.form.bs_title.value.length == 0){
		alert("제목을 입력하세요.");
		form.bs_title.focus();
		return;
	}
	if(document.form.bs_content.value.length == 0){
		alert("내용을 입력하세요.");
		form.bs_content.focus();
		return;
	}
	if(document.form.bs_pwd.value.length == 0){
		alert("비밀번호를 입력하세요.");
		form.bs_pwd.focus();
		return;
	}
	document.form.submit();
}

function delete_ok(){
	if(document.form.bs_pwd.value.length == 0){
		alert("비밀번호를 입력하세요.");
		form.bs_pwd.focus();
		return;
	}
	document.form.submit();
}
















