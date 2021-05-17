<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 쓰기</title>
	<script type="text/javascript" src="notice.js" charset="utf-8" ></script>
</head>
<body>
	<center>
		<h1>공 지 사 항 올 리 기</h1>
		<form name="form" action="hmno0102R.jsp?pageNum=<%= pageNum %>" method="post" enctype="multipart/form-data"> 
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
					<td><input type="text" name="n_name"> </td>
					<td>이메일</td>
					<td><input type="text" name="n_email"> </td>
				</tr>
				<tr>
					<td>글제목</td>
					<td colspan="3">
						<input type="text" size="55" name="n_title"></td>								
				</tr>
				<tr>
					<td>파  일</td>
					<td colspan="3">
						<input type="file" name="n_fname">
					</td>
				</tr>
				<tr>
					<td colspan="4"><textarea rows="10" cols="65" name="n_content"></textarea></td>
				</tr>
				<tr>
					<td>암&nbsp;&nbsp;호</td>
					<td colspan="3">
						<input type="password" name="n_pwd" size="12">
					</td>
				</tr>
				<tr align="center">
					<td colspan="4">
						<input type="button" value="등록" onclick="check_ok()">&nbsp;
						<input type="reset" value="다시작성">
						<input type="button" value="목록" onclick="location.href='hmno0103R.jsp?pageNum=<%= pageNum %>'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>