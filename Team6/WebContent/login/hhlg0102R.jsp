<%@page import="member.StudentBean"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	MemberDBBean db = MemberDBBean.getInstance();
	
	int code = db.userCheck(id, pwd);
	if(code > 0){ //학생=1, 교수=2, 관리자=3
		session.setAttribute("id", id);
		session.setAttribute("code", code);
		response.sendRedirect("hhma01R.jsp");
	
	}else if(code == 0){
%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%		
	}else{
%>
		<script>
			alert("아이디가 맞지 않습니다.");
			history.go(-1);
		</script>
<%		
	}
%>