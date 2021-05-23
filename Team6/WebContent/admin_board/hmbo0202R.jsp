<%@page import="myUtil.HanConv"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean2"%>
<%@page import="board.BoardDBBean2"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");

	int bid = Integer.parseInt(request.getParameter("bp_id"));
	BoardDBBean2 db=BoardDBBean2.getInstance();
	BoardBean2 board = db.getBoard(bid, true);
	
	int bp_id=0, bp_hit=0, bp_fsize=0;
	String bp_name="", bp_email="", bp_title="", bp_content="", bp_fname="";
	Timestamp bp_date=null;
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
	
	if(board != null){
		bp_id = board.getBp_id();
		bp_name = board.getBp_name();
		bp_email = board.getBp_email();
		bp_title = board.getBp_title();
		bp_content = board.getBp_content();
		bp_date = board.getBp_date();
		bp_hit = board.getBp_hit();
		//b_fname = board.getB_fname();
		bp_fname = board.getBp_rfname();
		bp_fsize = board.getBp_fsize();
	}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>글 내 용 보 기</h1>
		<table cellspacing="0" width="600" border="1">
			<tr align="center">
				<td width="100">글번호</td>
				<td width="200"><%= bp_id %> </td>
				<td width="100">조회수</td>
				<td width="200"><%= bp_hit %> </td>
			</tr>
			<tr align="center">
				<td width="100">작성자</td>
				<td width="200"><%= bp_name %> </td>
				<td width="100">작성일</td>
				<td width="200"><%= sdf.format(bp_date) %> </td>
			</tr>
			<tr>
				<td align="center">파일</td>
				<td colspan="3">
					<%
						if(bp_fname==null){
							out.println("<p>첨부파일 없음</p>");
						}else{
							out.println("<p>첨부파일 "+"<a href='hmbo0205W.jsp?fileN="+bp_id+"'>"+bp_fname+"</a></p>");
						}
					%>
				</td>
			</tr>
			<tr >
				<td width="100" align="center" >글제목</td>
				<td colspan="3"><%= bp_title %> </td>
			</tr>
			<tr>
				<td width="100" align="center" >글내용</td>
				<td colspan="3"><%= bp_content %> </td>
			</tr>
			<tr>
				<td colspan="4" align="right" >
					<input type="button" value="글삭제" onclick="location.href='hmbo0203W.jsp?bp_id=<%= bp_id %>&pageNum=<%= pageNum %>'" >
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="글목록" onclick="location.href='hmbo0201R.jsp?pageNum=<%= pageNum %>'" >
				</td>
			</tr>
		</table>
	</center>
</body>
</html>



















