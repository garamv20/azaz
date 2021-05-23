<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <li><a href="/izone/users/hm.jsp">HOME</a></li>
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
    <img src="main2.jpg" alt="" width="100%" >
    <h2>공지사항</h2>

 	<br/>
 	<br/>
 	
 	<ul class="sul">
                <li class="meme"><a class="menuLink" href="/izone/users/stuList.ga">학생정보 조회</a></li>
                <li class="meme"><a class="menuLink" href="/izone/users/stuWriteView.ga">학생정보 등록</a></li>
			</ul>
    	
    	<form action="/izone/users/stuUpdate.ga"  method="post" style="margin-bottom: 0;">
	<table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
		<tr>
			<td style="padding-top: 10px; text-align: center">
			</td>
		</tr>

		<tr>
			<td style="text-align: left">
				<p>
					<strong>학번을 입력하세요</strong>&nbsp;&nbsp;&nbsp;
				</p>
			</td>
		</tr>
		<tr>
			<td><input type="text" name="s_no"  required="required"
				aria-required="true"  value="${info.s_no}" readonly="readonly"
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="학번"></td>
		</tr>

		<tr>
			<td style="text-align: left">
				<p>
					<strong>비멀번호를 입력하세요</strong>&nbsp;&nbsp;&nbsp;
				</p>
			</td>
		</tr>
		<tr>
			<td><input type="password" name="s_pwd"  required="required"
				aria-required="true"  value="${info.s_pwd}"
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="비밀번호"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">
				<p>
					<strong>이름을 입력하세요.</strong>&nbsp;&nbsp;&nbsp;
				</p>
			</td>
		</tr>
		<tr>
			<td><input type="text" name="s_name"  required="required"
				aria-required="true"  value="${info.s_name}"
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="이름"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">
				<p>
					<strong>학년을 입력하세요.</strong>&nbsp;&nbsp;&nbsp;
				</p>
			</td>
		</tr>
		<tr>
			<td><input type="text" name="s_level"  required="required"
				aria-required="true" value="${info.s_level}"
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="학년"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">
				<p>
					<strong>이메일주소를 입력하세요.</strong>&nbsp;&nbsp;&nbsp;
				</p>
			</td>
		</tr>
		<tr>
			<td><input type="email" name="s_email"  required="required"
				aria-required="true" value="${info.s_email}"
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="e-mail"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">
				<p>
					<strong>생년월일을 입력하세요.</strong>&nbsp;&nbsp;&nbsp;
				</p>
			</td>
		</tr>
		<tr>
			<td><input type="text" name="s_birth"  required="required"
				aria-required="true" value="${info.s_birth}"
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="생년월일"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">
				<p>
					<strong>전화번호를 입력하세요.</strong>&nbsp;&nbsp;&nbsp;
				</p>
			</td>
		</tr>
		<tr>
			<td><input type="tel" name="s_tel"  required="required"
				aria-required="true"  value="${info.s_tel}"
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="전화번호"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">
				<p>
					<strong>재적상태를 입력하세요.</strong>&nbsp;&nbsp;&nbsp;
				</p>
			</td>
		</tr>
		<tr>
			<td><input type="text" name="s_status"  required="required"
				aria-required="true"  value="${info.s_status}"
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="재적상태"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">
				<p>
					<strong>전공번호를 입력하세요.</strong>&nbsp;&nbsp;&nbsp;
				</p>
			</td>
		</tr>
		<tr>
			<td><input type="text" name="MAJOR_no"  required="required"
				aria-required="true" value="${info.MAJOR_no}"
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="잔공번호"></td>
		</tr>
		
		<tr>
			<td style="text-align: left">
				<p>
					<strong>주민등록번호를 입력하세요.</strong>&nbsp;&nbsp;&nbsp;
				</p>
			</td>
		</tr>
		<tr>
			<td><input type="text" name="s_jumin"  required="required"
				aria-required="true"  value="${info.s_jumin}"
				style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
				placeholder="주민등록번호"></td>
		</tr>

		<tr>
			<td style="width: 100%; text-align: center; colspan: 3;">
			<input
				type="submit" value="수정완료" 
				style="background-color: #4B89DC; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
				<a href="/izone/users/stuDelete.ga?s_no=${info.s_no}" onclick="return confirm('정말로 삭제하시겠습니까?')"
				style="background-color: #4B89DC; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
				정보삭제</a>
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
</html>