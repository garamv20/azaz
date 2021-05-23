<%@page import="lecture.ScoreDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="exam" class="lecture.ExamBean"></jsp:useBean>
<jsp:setProperty property="*" name="exam"/>
<%
	ScoreDBBean db = ScoreDBBean.getInstance();
	int re = db.editExam(exam);
	
	if(re == 1){
%>
		<script>
			alert("수정되었습니다.");
			location.href= "hpsc0104R.jsp?s_no=" + <%= exam.getS_no() %>+"&l_no="+<%= exam.getL_no()%>;
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