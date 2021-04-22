<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int b_id = Integer.parseInt(request.getParameter("b_id")); //b_id를 받음 
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="board.js" charset="utf-8"></script>
</head>
<body>
	<center>
		<h1>글 삭 제 하 기</h1>
		<form action="delete_ok.jsp?b_id=<%= b_id %>" method="post" name="form">
		<!-- b_id다시 던짐 -->
			<table>
				<tr>
					<td colspan="2" align="left">
						<b> >> 암호를 입력하세요. << </b>
					</td>
				</tr>
				<tr>
					<td width="80">암&nbsp;&nbsp;호</td>
					<td><input type="password" size="14" name="b_pwd" maxlength="12"><td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="글삭제" onclick="delete_ok()">&nbsp;
						<input type="reset" value="다시작성" >&nbsp;
						<input type="button" value="글목록" onclick="location.href='list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>