<%@page import="member.MemberDBBean"%>
<%@page import="member.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int code;
	String id=null;
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
		code = ((Integer)(session.getAttribute("code"))).intValue();
	}
	StudentBean student = new StudentBean();
	student.setS_no(Integer.parseInt(id));
	student.setS_tel(request.getParameter("tel"));
	student.setS_email(request.getParameter("email"));
	student.setS_pwd(request.getParameter("pwd"));
	
	MemberDBBean db = MemberDBBean.getInstance();
	int re = db.editStudent(student);
	if(re == 1){
%>
		<script>
			alert("수정되었습니다.");
			location.href= "hsin0101R.jsp";
		</script>
<%
	}else{
%>
		<script>
			alert("수정에 실패했습니다.");
			history.go(-1);
		</script>
<%
	}
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>