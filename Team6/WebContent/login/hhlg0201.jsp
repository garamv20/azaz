<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비번찾기</title>
    <link rel="stylesheet" href="./find_id_pw.css" media="(min-width:670px)">
</head>
<body>
	<div class="main">
		<input id="tab1" type="radio" name="tabs" checked>
		<label for="tab1">아이디 찾기</label>
		<input id="tab2" type="radio" name="tabs">
		<label for="tab2">비밀번호 찾기</label>
		
		<div class="conbox con1">
			<form action="hhlg0202R.jsp" method="post">
				<table>
					<tr>
						<td>회원구분 :</td>
						<td> 
							<select name="code">
								<option value="1">학생</option>
								<option value="2">교수</option>
							</select> 
						</td>
					</tr>
					<tr>
						<td>이  름 :</td>
						<td> <input type="text" name="name"> </td>
					</tr>
					<tr>
						<td>E-mail :</td>
						<td> <input type="text" name="email"> </td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="확인">
							<input type="reset" value="다시작성">
							<input type="button" value="로그인하기" onclick="location.href='hhlg0101R.html'">
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<div class="conbox con2">
			<form action="hhlg0203R.jsp" method="post">
				<p>정보를 입력하시면 비밀번호가 초기화됩니다.(초기비밀번호: 주민번호 뒷7자리)</p>
				<table>
					<tr>
						<td>회원구분 :</td>
						<td> 
							<select name="code">
								<option value="1">학생</option>
								<option value="2">교수</option>
							</select> 
						</td>
					</tr>
					<tr>
						<td>아이디 :</td>
						<td> <input type="text" name="id"> </td>
					</tr>
					<tr>
						<td>주민번호 :</td>
						<td> <input type="password" name="jumin"> </td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="확인">
							<input type="reset" value="다시작성">
							<input type="button" value="로그인하기" onclick="location.href='hhlg0101R.html'">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>