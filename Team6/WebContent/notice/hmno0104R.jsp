<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="notice.NoticeBean"%>
<%@page import="notice.NoticeDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int code=0;
	if(request.getParameter("code") != null){
		if(Integer.parseInt(request.getParameter("code")) == 1){
		code = 1;
		}else if(Integer.parseInt(request.getParameter("code")) == 2){
			code = 2;
			}
	}
	System.out.println("######### code ="+code);
	String pageNum = request.getParameter("pageNum");
	int n_no = Integer.parseInt(request.getParameter("n_no")); //글번호 가져옴 
	
	NoticeDBBean db = NoticeDBBean.getInstance();
	NoticeBean notice = db.getNotice(n_no,true);
	
	int n_hit=0, n_fsize=0;
	String n_name="", n_div="", n_title="", n_content="", n_fname="";
	Timestamp n_date = null;
	
	if(notice != null){
		n_name = notice.getN_name();
		n_div = notice.getN_div();
		n_title = notice.getN_title();
		n_content = notice.getN_content();
		n_date = notice.getN_date();
		n_hit = notice.getN_hit();
		n_fname = notice.getN_rfname(); //실제파일이름을 n_fname에 담는다. 
		n_fsize = notice.getN_fsize();
	}
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>글 내 용 보 기</h1>
		<table cellspacing="0" width="600" border="1">
			<tr align="center">
				<td width="100">글번호</td>
				<td width="100"><%= n_no %> </td>
				<td width="100">구분</td>
				<td width="100"><%= n_div %></td>
				<td width="100">조회수</td>
				<td width="100"><%= n_hit %></td>
			</tr>
			<tr align="center">
				<td>작성자</td>
				<td><%= n_name %> </td>
				<td>작성일</td>
				<td colspan="3"><%= sdf.format(n_date) %> </td>
			</tr>
			<tr >
				<td width="100" align="center" >파일</td>
				<td colspan="5">
					<%	
						if(n_fname != null){
						out.println("<p>첨부파일 " + "<a href='hmno0105R.jsp?fileN="+n_no+"'>"+n_fname+"</a></p>");
						}
					%>
				</td>
			</tr>
			<tr >
				<td width="100" align="center" >글제목</td>
				<td colspan="5"><%= n_title %> </td>
			</tr>
			<tr>
				<td width="100" align="center" >글내용</td>
				<td colspan="5"><%= n_content %> </td>
			</tr>
			<tr>
				<td colspan="6"> 
				<%
					if(code == 1){
				%>
					<input type="button" value="글목록" onclick="location.href='hsno0101R.jsp?pageNum=<%= pageNum %>'"> 
				<%
					}else if(code == 2){
				%>
					<input type="button" value="글목록" onclick="location.href='hpno0101R.jsp?pageNum=<%= pageNum %>'"> 
				<%
					}else{
				%>
					<input type="button" value="글수정" onclick="location.href='hmno0301W.jsp?n_no=<%= n_no %>&pageNum=<%= pageNum %>'"> 
					<input type="button" value="글삭제" onclick="location.href='hmno0201R.jsp?n_no=<%= n_no %>&pageNum=<%= pageNum %>'"> 
					<input type="button" value="글목록" onclick="location.href='hmno0103R.jsp?pageNum=<%= pageNum %>'"> 
				<%
					}
				%>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>