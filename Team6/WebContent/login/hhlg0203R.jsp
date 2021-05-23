<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int code = Integer.parseInt(request.getParameter("code"));
	int id = Integer.parseInt(request.getParameter("id"));
	String jumin = request.getParameter("jumin");
	
	MemberDBBean db = MemberDBBean.getInstance();
	int re = db.findPW(code, id, jumin);
	
	if(re > 0){
%>
		<script>
			alert("비밀번호가 초기화 되었습니다.(주민번호 뒤7자리)");
			document.location.href="hhlg0101R.html";
		</script>
<%
	}else{
%>
		<script>
			alert("비밀번호 초기화에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>