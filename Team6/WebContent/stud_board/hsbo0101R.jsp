<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	BoardDBBean db=BoardDBBean.getInstance();
	ArrayList<BoardBean> boardList = db.listBoard(pageNum);
	int i, bs_id, bs_hit, bs_level, bs_fsize;
	String bs_name, bs_email, bs_title, bs_fname;
	Timestamp bs_date;
	
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
                <li><a href="gc.html">HOME</a></li>
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
            <li><a href="#">학적</a>
                <ul class="sub-ul">
                    <li><a href="#">학적사항</a></li>
                    <li><a href="#">개인정보수정</a></li>
                </ul>
            </li>
            <li><a href="#">수업</a>
                <ul class="sub-ul">
                    <li><a href="#">강좌조회</a></li>
                    <li><a href="#">수강신청</a></li>
                    <li><a href="#">수강신청 확인/정정</a></li>
                    <li><a href="#">시간표조회</a></li>
                </ul>
            </li>
            <li><a href="#">성적</a>
                <ul class="sub-ul">
                    <li><a href="#">현학기 성적조회</a></li>
                    <li><a href="#">전체 성적조회</a></li>
                </ul>
            </li>
            
            <li><a href="hsbo0101R.jsp">게시판</a>
                <ul class="sub-ul">
                    <li><a href="#">공지사항</a></li>
                    <li><a href="hsbo0101R.jsp">자유게시판</a></li>
                </ul>
            </li>
        </ul>
    <!-- </nav> -->


        	
    </header>


	<center>
		<h1 align="center" style="margin-left: auto;margin-right: auto;margin-top: 100px;margin-bottom: 50px;">게시판에 등록된 글 목록 보기</h1>
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
						BoardBean board = boardList.get(i);
						bs_id = board.getbs_id();
						bs_title = board.getbs_title();
						bs_name = board.getbs_name();
						bs_email = board.getbs_email();
						bs_date = board.getbs_date();
						bs_hit = board.getbs_hit();
						bs_level = board.getbs_level();
						bs_fname = board.getbs_fname();
						bs_fsize = board.getbs_fsize();
				%>
						<tr bgcolor="#f7f7f7" 
							onmouseover="this.style.backgroundColor='#eeeeef'" 
							onmouseout="this.style.backgroundColor='#f7f7f7'">
							<td align="center">
								<%= bs_id %>
							</td>
							<td>
								<%
									if(bs_fsize > 0){
								%>
										<img src="../images/zip.gif">
								<%
									}
								%>
							</td>
							<td>
								<%
									if(bs_level > 0){
										for(int j=0; j< bs_level; j++){
								%>
											&nbsp;
								<%
										}
								%>
										<img src="../images/AnswerLine.gif" width="16" height="16">
								<%
									}
								%>
								<a href="hsbo0301R.jsp?bs_id=<%= bs_id %>&pageNum=<%= pageNum %>"><%= bs_title %></a>
							</td>
							<td align="center">
								<a href="mailto:<%= bs_email %>"><%= bs_name %></a>
							</td>
							<td align="center">
								<%= sdf.format(bs_date) %>
							</td>
							<td align="center">
								<%= bs_hit %>
							</td>
						</tr>
				<%
					}
				%>
			</table>
			<a class="btn btn-default" href="hsbo0201W.jsp?pageNum=<%= pageNum %>">글 쓰 기</a>
		</div>
	</center>
	<br>
	<br>
	<center>
		<%= BoardBean.pageNumber(4) %>
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


















