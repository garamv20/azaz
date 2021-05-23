<%@page import="mlecture.M_lectureDBbean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	int l_no =  Integer.parseInt(request.getParameter("l_no")) ;
	M_lectureDBbean dBbean = M_lectureDBbean.getinstance();
	int re =dBbean.mlecdelete(l_no);
	if(re==1){
		%>
			<script>
				alert("삭제하겠습니다.");
				location.href='hmle01W.jsp';
			</script>
		<%
	}else{
		%>
		<script>
			alert("실패했습니다..");
			history.go(-1);
		</script>
	<%
	}
%>