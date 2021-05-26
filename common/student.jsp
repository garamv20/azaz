<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="notice.NoticeBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="notice.NoticeDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	NoticeDBBean db = NoticeDBBean.getInstance();
	ArrayList<NoticeBean> noticeList = db.listStudentNotice(pageNum);
	int i, n_no, n_hit, n_fsize, number=0;
	String n_div, n_name, n_title, n_fname;
	Timestamp n_date;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./style1.css">
</head>
<body>
	<jsp:include page="./stu_menu.jsp"></jsp:include>
	<div id="page">
	<img src="../images/s_banner1.jpg" class="d-block w-100" alt="...">
	<hr>
	<center>
		<h4>공지사항</h4>
			<table class="table table-hover">
			<thead>
			<tr>
				<td width="40">번호</td>
				<td width="90">첨부파일</td>
				<td width="70">구분</td>
				<td width="350">글제목</td>
				<td width="120">작성자</td>
				<td width="180">작성일</td>
				<td width="60">조회수</td>
			</tr>
			</thead>
			<%
				for(i=0; i<noticeList.size();i++){
					NoticeBean notice = noticeList.get(i);
					n_no=notice.getN_no();
					n_div=notice.getN_div();
					n_title=notice.getN_title();
					n_name=notice.getN_name();
					n_date=notice.getN_date();
					n_hit=notice.getN_hit();
					n_fname=notice.getN_fname();
					n_fsize=notice.getN_fsize();
					number++;
			%>
				<tr bgcolor="#f7f7f7" 
						onmouseover="this.style.backgroundColor='#eeeeef'" 
						onmouseout="this.style.backgroundColor='#f7f7f7'">
					<td><%= number %></td>
					<td>
							<%
								if(n_fsize > 0){
							%>
								<img src="../images/zip.gif">
							<%
								}
							%>
						</td>
					<td><%= n_div %></td>
					<td>
						<a href="../notice/hmno0104R.jsp?n_no=<%= n_no %>&pageNum=<%= pageNum %>&code=1"><%= n_title %></a>
					</td>
					<td><%= n_name %></td>
					<td><%= sdf.format(n_date) %></td>
					<td><%= n_hit %></td>
				</tr>

			<%
				}
			%>
		</table>
	</center>
	<br>
	<br>	
	<center>
		<%= NoticeBean.pageNumber(4) %>
	</center>
	<br>
	<hr>
	<footer>
        <ul>
            <li>부산 부산진구 중앙대로 688</li>
            <li>TEL : 051-912-1000</li>
            <li>copyrights (C) KASAN UNIVERSITY. ALL RIGHTS RESERVED</li>
        </ul>
    </footer>
	</div>
</body>
</html>