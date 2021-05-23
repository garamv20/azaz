function check_ok(){
	if(document.form.bp_name.value.length == 0){
		alert("이름을 입력하세요.");
		form.bp_name.focus();
		return;
	}
	if(document.form.bp_title.value.length == 0){
		alert("제목을 입력하세요.");
		form.bp_title.focus();
		return;
	}
	if(document.form.bp_content.value.length == 0){
		alert("내용을 입력하세요.");
		form.bp_content.focus();
		return;
	}
	if(document.form.bp_pwd.value.length == 0){
		alert("비밀번호를 입력하세요.");
		form.bp_pwd.focus();
		return;
	}
	document.form.submit();
}

function delete_ok(){
	if(document.form.bp_pwd.value.length == 0){
		alert("비밀번호를 입력하세요.");
		form.bp_pwd.focus();
		return;
	}
	document.form.submit();
}
















