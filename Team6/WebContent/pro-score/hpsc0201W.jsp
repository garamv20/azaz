<%@page import="lecture.ExamBean"%>
<%@page import="lecture.ScoreDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int s_no =Integer.parseInt(request.getParameter("s_no"));
	int l_no =Integer.parseInt(request.getParameter("l_no"));
	
	ScoreDBBean db = ScoreDBBean.getInstance();
	ExamBean exam = db.getExam(s_no, l_no);
	if(exam != null){
		
	}
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>exam update</title>
	<script type="text/javascript" src="score.js" charset="UTF-8" ></script>
</head>
<body>
	<center>
	<form name="form" action="hpsc0202R.jsp" method="post">
		<input type="hidden" name="s_no" value="<%= s_no %>">
		<input type="hidden" name="l_no" value="<%= l_no %>">
		<h2>수정하기</h2>
		<td>학번: <%= s_no %> </td><br>>
		<td>이름: </td><br>
		<td>중간: <input type="text" name="midEx" id="mid" onkeyup="call()"> </td><br>
		<td>기말: <input type="text" name="finalEx" id="final" onkeyup="call()"> </td><br>
		<td>과제: <input type="text" name="task" id="task" onkeyup="call()"> </td><br>
		<td>합계: <input type="text" name="total" id="total" onkeyup="call()"> </td><br>
		<td>성적: <input type="text" name="score" id="score"> </td><br>
		<input type="button" value="수정" onclick="check_ok()">
		<input type="reset" value="다시입력">
		<input type="button" value="취소" onclick="location.href='hpsc0104R.jsp?l_no=<%= l_no%>'">
	</form>
		
	</center>
</body>
</html>