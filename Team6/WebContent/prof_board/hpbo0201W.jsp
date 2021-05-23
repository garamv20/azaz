<%@page import="board.BoardBean2"%>
<%@page import="board.BoardDBBean2"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");

	int bp_id=0, bp_ref=1, bp_step=0, bp_level=0;
	String bp_title="";
	if(request.getParameter("bp_id") != null){
		bp_id = Integer.parseInt(request.getParameter("bp_id"));
	}
	
	BoardDBBean2 db=BoardDBBean2.getInstance();
	BoardBean2 board = db.getBoard(bp_id, false);
	
	if(board != null){
		bp_title = board.getBp_title();
		bp_ref = board.getBp_ref();
		bp_step = board.getBp_step();
		bp_level = board.getBp_level();
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
		<form name="form" action="hpbo0202W.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="bp_id" value="<%= bp_id %>" >
			<input type="hidden" name="bp_ref" value="<%= bp_ref %>" >
			<input type="hidden" name="bp_step" value="<%= bp_step %>" >
			<input type="hidden" name="bp_level" value="<%= bp_level %>" >
			<table>
				<tr>
					<td>작성자</td>
					<td><input type="text" name="bp_name"> </td>
					<td>이메일</td>
					<td><input type="text" name="bp_email"> </td>
				</tr>
				<tr>
					<td>글제목</td>
					<td colspan="3">
						<%
							if(bp_id == 0){
								%>
									<input type="text" size="55" name="bp_title"> 
								<%
							}else{
								%>
									<input type="text" size="55" name="bp_title" value="[답변]:<%= bp_title %>"> 
								<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td>파    일</td>
					<td>
						<input type="file" name="bp_fname">
					</td>
				</tr>
				<tr>
					<td colspan="4"><textarea rows="10" cols="65" name="bp_content"></textarea> </td>
				</tr>
				<tr>
					<td>암&nbsp;&nbsp;호</td>
					<td><input type="password" name="bp_pwd" maxlength="12" > </td>
				</tr>
				<tr align="center">
					<td colspan="4">
						<input type="button" value="글쓰기" onclick="check_ok()">&nbsp;
						<input type="reset" value="다시작성">
						<input type="button" value="글목록" onclick="location.href='hpbo0101R.jsp?pageNum=<%= pageNum %>'" >
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>














