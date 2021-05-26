<%@page import="mprofessor.MProfessorDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<meta charset="EUC-KR">
<%
	int p_no = Integer.parseInt(request.getParameter("p_no"));
	String name = request.getParameter("name");
	String jumin =request.getParameter("jumin");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	String room =request.getParameter("room");
	int major = Integer.parseInt(request.getParameter("major_no"));
	
	MProfessorDBBean db = MProfessorDBBean.getinstance();
	int re = db.updatepro(p_no, name, jumin, tel, email, room, major);
	
	if(re==1){
		%>
	
			<script>
				alert("수정되었습니다.");
				location.href="hmpr0101R.jsp";
			</script>
		<%
	}else{
		%>
		
		<script>
			alert("수정에 실패하였습니다.");
			location.href="hmpr0101R.jsp";
		</script>
	<%
	}
%>