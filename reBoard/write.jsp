<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="board.js" charset="utf-8"></script>
</head>
<body>
	<center>
		<h1 align="center">글 올 리 기</h1>
		<form name="bor_frm" action="write_ok.jsp" method="post">
			<table>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="b_name"></td>
					<td>이메일</td>
					<td><input type="text" name="b_email"></td>
				</tr>
				<tr>
					<td>글제목</td>
					<td colspan="3"><input type="text" size="55" name="b_title"></td>
				</tr>
				<tr>
					<td colspan="4"><textarea rows="10" cols="65" name="b_content"></textarea></td>
				</tr>
				<tr>
					<td>암&nbsp;&nbsp;호</td>
					<td><input type="password" name="b_pwd" maxlength="12"><td>
				</tr>
				<tr align="center">
					<td colspan="4">
						<input type="button" value="글쓰기" onclick="check_ok()">&nbsp;
						<input type="reset" value="다시작성">
						<input type="button" value="글목록" onclick="javascript:window.location='list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>