<%@page import="mprofessor.MProfessorDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<meta charset="EUC-KR">
<%
	int p_no = Integer.parseInt(request.getParameter("p_no"));
	MProfessorDBBean db = MProfessorDBBean.getinstance();
	int re= db.deletempro(p_no);
	if(re==1){
		%>
	
			<script>
				alert("삭제되었습니다.");
				location.href="hmpr0101R.jsp";
			</script>
		<%
	}else{
		%>
		
		<script>
			alert("삭제에 실패하였습니다.");
			location.href="hmpr0101R.jsp";
		</script>
	<%
	}
%>