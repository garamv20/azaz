function check_ok(){
	if(document.form.midEx.value.length == 0){
		alert("중간고사 점수를 입력하세요.");
		form.midEx.focus();
		return;
	}
	if(document.form.finalEx.value.length == 0){
		alert("기말고사 점수를 입력하세요.");
		form.finalEx.focus();
		return;
	}
	if(document.form.task.value.length == 0){
		alert("과제점수를 입력하세요.");
		form.task.focus();
		return;
	}
	document.form.submit();
}

function call(){
	if(document.getElementById("mid").value && document.getElementById("final").value && document.getElementById("task")){
  	document.getElementById('total').value =parseInt(document.getElementById('mid').value) + parseInt(document.getElementById('final').value) + parseInt(document.getElementById('task').value);
	score(document.getElementById('total').value);
	}else{
	document.getElementById('total').value = 0;
	}
}
function score(total){ 
	var score ="";
	if(total>=90){
		score ="A";
	}else if(total>=80){
		score ="B";
	}else if(total>=70){
		score ="C";
	}else if(total>=60){
		score ="D";
	}else{
		score ="F";
	}
	document.getElementById('score').value = score;
}

function confirm(){
	confirm("성적 최종확정 후에는 수정이 불가합니다. 확정하시겠습니까?");
}
