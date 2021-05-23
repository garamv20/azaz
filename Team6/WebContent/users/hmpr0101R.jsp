<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>가산대학교 관리자지원시스템</title>
</head>
<body>
    <div id="page">
    <header>
        <div class="top_bg">
        <div class="top-left-header">
            <ul>
                <li><a href="/users/hm.jsp">HOME</a></li>
                <li><a href="#">LOGOUT</a></li>
            </ul>
        </div>
    </div>
        <div class="logo">
            <h1><img src="..\images\kasanlogo2.jpg" alt="KASAN UNIVERSITY" >
                가산대학교</h1>
        </div>

	<nav>
        <ul class="main-ul">
            <li><a href="#">사용자 관리</a>
                <ul class="sub-ul">
                    <li><a href="/izone/users/stuList.ga">학생 관리</a></li>
                    <li><a href="/izone/users/proList.ga">교직원 관리</a></li>
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
                    <li><a href="#">게시판</a></li>
                    <li><a href="#">공지사항</a></li>
                </ul>
            </li>
        </ul>
    </nav>

    </header>
    
    <h2>공지사항</h2>

 	<br/>
 	<br/>
    <br/>
            <ul class="sul">
                <li class="meme"><a class="menuLink" href="/izone/users/proList.ga">교직원정보 조회</a></li>
                <li class="meme"><a class="menuLink" href="/izone/users/proWriteView.ga">교직원정보 등록</a></li>
			</ul>        
   
    
    <table>
						
						<tr style="margin-top: 0; height: 30	px; color: white; border: 0px solid #f78f24; opacity: 0.8">
							<th>직원번호 &nbsp;&nbsp;</th>
							<th>비밀번호 &nbsp;&nbsp;</th>
							<th>이름&nbsp;&nbsp;</th>
							<th>생년월일&nbsp;&nbsp;</th>
							<th>전화번호&nbsp;&nbsp;</th>
							<th>이메일&nbsp;&nbsp;</th>
							<th>강의실&nbsp;&nbsp;</th>
							<th>전공번호&nbsp;&nbsp;</th>
						</tr>

						<c:forEach var = "info" items="${infos}">
						<tr>
							<!-- 게시글리스트가 들어갈 행 -->
							<td align="center">
								<a href="/izone/users/proContentView.ga?p_no=${info.p_no}" style="green: ;">
								${info.p_no}
								</a>
							</td>
							<td align="center">
								<a href="/izone/users/proContentView.ga?p_no=${info.p_no}" style="green: ;">
								${info.p_pwd}
								</a>
							</td>
							<td align="center">
								<a href="/izone/users/proContentView.ga?p_no=${info.p_no}" style="green: ;">
								${info.p_name}
								</a>
							</td>
							<td align="center">
								<a href="/izone/users/proContentView.ga?p_no=${info.p_no}" style="green: ;">
								${info.p_birth}
								</a>
							</td>
							<td align="center">
								<a href="/izone/users/proContentView.ga?p_no=${info.p_no}" style="green: ;">
								${info.p_tel}
								</a>
							</td>
							<td align="center">
								<a href="/izone/users/proContentView.ga?p_no=${info.p_no}" style="green: ;">
								${info.p_email}
								</a>
							</td>
							<td align="center"> 
								<a href="/izone/users/proContentView.ga?p_no=${info.p_no}" style="green: ;">
								${info.p_room}
								</a>
							</td>
							<td align="center">
								<a href="/izone/users/proContentView.ga?p_no=${info.p_no}" style="green: ;">
								${info.MAJOR_no}
								</a>
							</td>											
						</tr>		
						</c:forEach>	 					
						</table>
    
    
   
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