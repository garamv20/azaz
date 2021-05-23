<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean2"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean2"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	BoardDBBean2 db=BoardDBBean2.getInstance();
	ArrayList<BoardBean2> boardList = db.listBoard(pageNum);
	int i, bp_id, bp_hit, bp_level, bp_fsize;
	String bp_name, bp_email, bp_title, bp_fname;
	Timestamp bp_date;
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="bootstrap.css">
    <title>가산대학교 교직원지원시스템</title>
</head>
<body>
	<div id="page">
    <header>
        <div class="top_bg">
        <div class="top-left-header">
            <ul>
                <li><a href="#">HOME</a></li>
                <li><a href="#">LOGOUT</a></li>
            </ul>
        </div>
    </div>
        <div class="logo">
            <h1><img src="kasanlogo2.jpg" alt="KASAN UNIVERSITY" >
                가산대학교</h1>
        </div>
        
    
       <!-- <nav> -->
        <ul class="main-ul">
            <li><a href="#">사용자 관리</a>
                <ul class="sub-ul">
                    <li><a href="#">학생 관리</a></li>
                    <li><a href="#">교직원 관리</a></li>
                </ul>
            </li>
            <li><a href="#">강의 관리</a>
                <ul class="sub-ul">
                    <li><a href="#">강의 개설</a></li>
                    <li><a href="#">강의 삭제</a></li>
                    
                </ul>
            </li>
            <li><a href="#">게시판 관리</a>
                <ul class="sub-ul">
                    <li><a href="hmbo0101R.jsp">학생게시판</a></li>
                    <li><a href="hmbo0201R.jsp">교수게시판</a></li>
                    <li><a href="#">공지사항</a></li>
                </ul>
            </li>
            
            
        </ul>
    <!-- </nav> -->


        	
    </header>


	<center style="">
		<h1 align="center" style="margin-left: auto;margin-right: auto;margin-top: 100px;margin-bottom: 50px;">교수 게시판</h1>
		<div class="container">
			<table class="table table-hover">
				<tr>
					<td align="center">번호</td>
					<td>첨부파일</td>
					<td>글제목</td>
					<td align="center">작성자</td>
					<td align="center">작성일</td>
					<td align="center">조회수</td>
				</tr>
				<%
					for(i=0; i<boardList.size(); i++){
						BoardBean2 board = boardList.get(i);
						bp_id = board.getBp_id();
						bp_title = board.getBp_title();
						bp_name = board.getBp_name();
						bp_email = board.getBp_email();
						bp_date = board.getBp_date();
						bp_hit = board.getBp_hit();
						bp_level = board.getBp_level();
						bp_fname = board.getBp_fname();
						bp_fsize = board.getBp_fsize();
				%>
						<tr bgcolor="#f7f7f7" 
							onmouseover="this.style.backgroundColor='#eeeeef'" 
							onmouseout="this.style.backgroundColor='#f7f7f7'">
							<td align="center">
								<%= bp_id %>
							</td>
							<td>
								<%
									if(bp_fsize > 0){
								%>
										<img src="../images/zip.gif">
								<%
									}
								%>
							</td>
							<td>
								<%
									if(bp_level > 0){
										for(int j=0; j< bp_level; j++){
								%>
											&nbsp;
								<%
										}
								%>
										<img src="../images/AnswerLine.gif" width="16" height="16">
								<%
									}
								%>
								<a href="hmbo0202R.jsp?bp_id=<%= bp_id %>&pageNum=<%= pageNum %>"><%= bp_title %></a>
							</td>
							<td align="center">
								<a href="mailto:<%= bp_email %>"><%= bp_name %></a>
							</td>
							<td align="center">
								<%= sdf.format(bp_date) %>
							</td>
							<td align="center">
								<%= bp_hit %>
							</td>
						</tr>
				<%
					}
				%>
			</table>
		</div>
	</center>
	<br>
	<br>
	<center>
		<%= BoardBean2.pageNumber(4) %>
	</center>
	
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


















