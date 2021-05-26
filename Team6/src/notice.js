function check_ok(){
	if(document.form.n_name.value.length == 0){
		alert("작성자를 입력하세요.");
		form.n_name.focus();
		return;
	}
	if(document.form.n_title.value.length == 0){
		alert("제목을 입력하세요.");
		form.n_title.focus();
		return;
	}
	if(document.form.n_content.value.length == 0){
		alert("내용을 입력하세요.");
		form.n_content.focus();
		return;
	}
	if(document.form.n_pwd.value.length == 0){
		alert("비밀번호를 입력하세요.");
		form.n_pwd.focus();
		return;
	}
	document.form.submit();
}

function delete_ok(){
	if(document.form.n_pwd.value.length == 0){
		alert("비밀번호를 입력하세요.");
		form.n_pwd.focus();
		return;
	}
	document.form.submit();
}