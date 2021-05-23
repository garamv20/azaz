<%@page import="board.BoardBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");

	int bs_id=0, bs_ref=1, bs_step=0, bs_level=0;
	String bs_title="";
	if(request.getParameter("bs_id") != null){
		bs_id = Integer.parseInt(request.getParameter("bs_id"));
	}
	
	BoardDBBean db=BoardDBBean.getInstance();
	BoardBean board = db.getBoard(bs_id, false);
	
	if(board != null){
		bs_title = board.getbs_title();
		bs_ref = board.getbs_ref();
		bs_step = board.getbs_step();
		bs_level = board.getbs_level();
	}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="board.js" charset="utf-8" ></script>
</head>
<body>
	<center>
		<h1>글 올 리 기</h1>
		<form name="form" action="hsbo0202W.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="bs_id" value="<%= bs_id %>" >
			<input type="hidden" name="bs_ref" value="<%= bs_ref %>" >
			<input type="hidden" name="bs_step" value="<%= bs_step %>" >
			<input type="hidden" name="bs_level" value="<%= bs_level %>" >
			<table>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="bs_name"> </td>
					<td>이메일</td>
					<td><input type="text" name="bs_email"> </td>
				</tr>
				<tr>
					<td>글제목</td>
					<td colspan="3">
						<%
							if(bs_id == 0){
								%>
									<input type="text" size="55" name="bs_title"> 
								<%
							}else{
								%>
									<input type="text" size="55" name="bs_title" value="[답변]:<%= bs_title %>"> 
								<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td>파    일</td>
					<td>
						<input type="file" name="bs_fname">
					</td>
				</tr>
				<tr>
					<td colspan="4"><textarea rows="10" cols="65" name="bs_content"></textarea> </td>
				</tr>
				<tr>
					<td>암&nbsp;&nbsp;호</td>
					<td><input type="password" name="bs_pwd" maxlength="12" > </td>
				</tr>
				<tr align="center">
					<td colspan="4">
						<input type="button" value="글쓰기" onclick="check_ok()">&nbsp;
						<input type="reset" value="다시작성">
						<input type="button" value="글목록" onclick="location.href='hsbo0101R.jsp?pageNum=<%= pageNum %>'" >
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>














