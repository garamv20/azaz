function confirm(s_pwd){
	var pwd = prompt("비밀번호를 입력해주세요.","");
	if(s_pwd == pwd){
		alert("확인되었습니다");
		location.href="hsin0102W.jsp";
	}else{
		alert("잘못된 비밀번호입니다.");
		location.reload();
	}
}
function check_ok(){
	if(document.form.tel.value.length == 0){
		alert("전화번호를 입력하세요.");
		form.tel.focus();
		return;
	}
	if(document.form.email.value.length == 0){
		alert("E-mail을 입력하세요.");
		form.email.focus();
		return;
	}
	if(document.form.pwd.value.length == 0){
		alert("비밀번호를 입력하세요.");
		form.pwd.focus();
		return;
	}
	if(document.form.pwd.value != document.form.pwd2.value){
		alert("비밀번호가 일치하지 않습니다.");
		form.pwd2.focus();
		return;
	}
	document.form.submit();
}