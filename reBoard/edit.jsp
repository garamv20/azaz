<%@page import="magic.board.BoardBean"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	BoardDBBean db = BoardDBBean.getInstance();
	BoardBean board = db.getBoard(b_id, false);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="board.js" charset="utf-8"></script>
</head>
<body>
	<center>
		<h1 align="center">글 수 정 하 기</h1>
		<form name="bor_frm" action="edit_ok.jsp?b_id=<%= b_id %>" method="post">
			<table>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="b_name" value="<%= board.getB_name() %>"></td>
					<td>이메일</td>
					<td><input type="text" name="b_email" value="<%= board.getB_email()%>"></td>
				</tr>
				<tr>
					<td>글제목</td>
					<td colspan="3"><input type="text" size="55" name="b_title" value="<%= board.getB_title()%>"></td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="10" cols="65" name="b_content" align="left">
							<%= board.getB_content()%>
						</textarea>
					</td>
				</tr>
				<tr>
					<td>암&nbsp;&nbsp;호</td>
					<td><input type="password" name="b_pwd" maxlength="12"><td>
				</tr>
				<tr align="center">
					<td colspan="4">
						<input type="button" value="글수정" onclick="check_ok()">&nbsp;
						<input type="reset" value="다시작성">
						<input type="button" value="글목록" onclick="javascript:window.location='list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>