<%@page import="kr.co.koo.izone.user.STUDENT_VO"%>
<%@page import="kr.co.koo.izone.user.STUDENT_DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <title>가산대학교 학생지원시스템</title>
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
            <h1><img src="..\image\kasanlogo2.jpg" alt="KASAN UNIVERSITY" >
                가산대학교</h1>
        </div>


       <nav>
        <ul class="main-ul">
            <li><a href="#">학적</a>
                <ul class="sub-ul">
                    <li><a href="#">학적사항</a></li>
                    <li><a href="stu_update.jsp">개인정보수정</a></li>
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

            <li><a href="#">게시판</a>
                <ul class="sub-ul">
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">자유게시판</a></li>
                </ul>
            </li>
        </ul>
   </nav>
    </header>
<%
	//String name =(String) session.getAttribute("stu_name");  //세션에 등록된 이름을 가져옴
	//if(name==null) response.sendRedirect("hhlg01W"); //세션에서 가져온 값이 null(없다)면~ 로그인 페이지로 던짐
	
	//String num = (String) session.getAttribute("stu_no");  //세션에 등록된 학번을 가져옴
	String name = "이순신";
	int num = 8452;
	STUDENT_DAO dao = STUDENT_DAO.getInstance();
	STUDENT_VO stu = dao.getMemberInfo(num);    //정보변경 메서드 호출
%>

<br />
<br />

		
		<br />
		<form action="stu_update_ok.jsp" 
			method="post" style="margin-bottom: 0;">

	<table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
		<tr>
			<td style="padding-top: 10px; text-align: center">
				<p>
					<strong><%=name%>(<%=num %>)님의 정보를 수정합니다.</strong>
				</p>
			</td>
		</tr>

		<tr>
			<td style="text-align: left">
				<p>
					<strong>변경할 비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;
				</p>
			</td>
		</tr>
		<tr>
			<td><input type="text" name="userPwd"  required="required"
				aria-required="true" 
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="password"></td>
		</tr>

		<tr>
			<td style="text-align: left">
				<p>
					<strong>변경할 이메일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;
				</p>
			</td>
		</tr>
		<tr>
			<td><input type="email" name="userEmail"  required="required"
				aria-required="true" value="<%=stu.getS_email() %>"
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="ex) xxxxxxxx@xxxx.com"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">
				<p>
					<strong>변경할 전화번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;
				</p>
			</td>
		</tr>
		<tr>
			<td><input type="tel" name="userTel"  required="required"
				aria-required="true" value="<%=stu.getS_tel()%>"
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="ex) xxx-xxxx-xxxx"></td>
		</tr>

		<tr>
			<td style="width: 100%; text-align: center; colspan: 3;"><input
				type="submit" value="정보 수정" 
				style="background-color: #4B89DC; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
			</td>
		</tr>

	</table>
</form>
<footer>
        <ul>
            <li>부산 부산진구 중앙대로 688</li>
            <li>TEL : 051-912-1000</li>
            <li>copyrights (C) KASAN UNIVERSITY. ALL RIGHTS RESERVED</li>
        </ul>
    </footer>
</div>
</body>


