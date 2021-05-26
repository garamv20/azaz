<%@page import="mlecture.M_lectureDBbean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		int l_no = Integer.parseInt(request.getParameter("l_no"));
	String l_name = request.getParameter("name");
	int l_level = Integer.parseInt(request.getParameter("level"));
	int l_sem = Integer.parseInt(request.getParameter("sem"));
	int l_start = Integer.parseInt(request.getParameter("time"));
	int l_max = Integer.parseInt(request.getParameter("max"));
	int l_com = Integer.parseInt(request.getParameter("com"));
	int major_no = Integer.parseInt(request.getParameter("major_no"));
	int professor_p_no = Integer.parseInt(request.getParameter("professor_p_no"));
	String l_day = request.getParameter("day");
	M_lectureDBbean bbean = M_lectureDBbean.getinstance();
	int re = bbean.updatemale(l_no, l_name, l_level, l_sem, l_max, l_day, l_start, l_com, major_no, professor_p_no);

	if (re == 1) {
	%>
	<script>
		alert("수정이 완료 되었습니다.");
		location.href = 'hmle01W.jsp';
	</script>
	<%
		} else {
	%>
	<script>
		alert("수정이에 실패하였습니다.");
		location.href = 'hmle01W.jsp';
	</script>
	<%
		}
	%>
</body>
</html>