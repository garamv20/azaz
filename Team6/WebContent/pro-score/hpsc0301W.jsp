<%@page import="lecture.LectureBean"%>
<%@page import="lecture.ScoreDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int l_no = Integer.parseInt(request.getParameter("l_no"));
	ScoreDBBean db = ScoreDBBean.getInstance();
	
	if(db.insertScore(l_no) ==1){
		response.sendRedirect("hpsc0101R.jsp");
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>최종 성적 반영</title>
</head>
<body>
</body>
</html>