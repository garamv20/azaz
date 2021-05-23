<%@page import="notice.NoticeBean"%>
<%@page import="notice.NoticeDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNum = request.getParameter("pageNum");
	int n_no = Integer.parseInt(request.getParameter("n_no"));

	NoticeDBBean db = NoticeDBBean.getInstance();
	NoticeBean notice = db.getNotice(n_no, false);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="notice.js" charset="utf-8" ></script>
</head>
<body>
	<center>
		<h1>수 정 하 기</h1>
		<form name="form" action="hmno0302R.jsp?n_no=<%= n_no %>&pageNum=<%= pageNum %>" method="post"> 
			<table>
				<tr>
					<td>구분</td>
					<td colspan="3">
						<input type="radio" name="n_div" value="학생">학생&nbsp;&nbsp;
						<input type="radio" name="n_div" value="교수">교수&nbsp;&nbsp;
						<input type="radio" name="n_div" value="관리자">관리자
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="n_name" value="<%= notice.getN_name() %>"> </td>
					<td>이메일</td>
					<td><input type="text" name="n_email" value="<%= notice.getN_email() %>"> </td>
				</tr>
				<tr>
					<td>글제목</td>
					<td colspan="3">
						<input type="text" size="55" name="n_title" value="<%= notice.getN_title() %>"></td>								
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="10" cols="65" name="n_content">
						<%= notice.getN_content() %>
						</textarea>
					</td>
				</tr>
				<tr>
					<td>암&nbsp;&nbsp;호</td>
					<td colspan="3">
						<input type="password" name="n_pwd" size="12">
					</td>
				</tr>
				<tr align="center">
					<td colspan="4">
						<input type="button" value="글수정" onclick="check_ok()">&nbsp;
						<input type="reset" value="다시작성">
						<input type="button" value="목록" onclick="location.href='hmno0103R.jsp?pageNum=<%= pageNum %>'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>