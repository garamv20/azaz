<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	System.out.println("@@@### pageNum ===>"+pageNum);
	
	int bs_id = Integer.parseInt(request.getParameter("bs_id"));
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="board.js" charset="utf-8"></script>
</head>
<body>
	<center>
		<h1>글 삭 제 하 기</h1>
		<form name="form" action="hsbo0402W.jsp?bs_id=<%= bs_id %>" method="post">
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
						<input name="bs_pwd" type="password" size="12">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="글삭제" onclick="delete_ok()">&nbsp;
						<input type="reset" value="다시작성">&nbsp;
						<input type="button" value="글목록" onclick="location.href='hsbo0101R.jsp?pageNum=<%= pageNum %>'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>





















