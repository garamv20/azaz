<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int n_no = Integer.parseInt(request.getParameter("n_no"));
	String pageNum = request.getParameter("pageNum");

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="notice.js" charset="utf-8" ></script>
</head>
<body>
	<center>
		<h1>글 삭 제 하 기</h1>
		<form name="form" action="hmno0202R.jsp?n_no=<%= n_no %>&pageNum=<%= pageNum %>" method="post">
			<table>
				<tr>
					<td colspan="2" align="left">
						<b>>> 암호를 입력하세요. <<
						</b>
					</td>
				</tr>
				<tr>
					<td width="80">
						암&nbsp;&nbsp;호
					</td>
					<td>
						<input name="n_pwd" type="password" size="12">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="글삭제" onclick="delete_ok()">&nbsp;
						<input type="reset" value="다시작성">&nbsp;
						<input type="button" value="글목록" onclick="location.href='hmno0103R.jsp?pageNum=<%= pageNum %>'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>