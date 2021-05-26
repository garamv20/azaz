<%@page import="member.StudentBean"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int code;
	String id=null;
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
		code = ((Integer)(session.getAttribute("code"))).intValue();
	}
	MemberDBBean db = MemberDBBean.getInstance();
	StudentBean student = db.getStudent(id);
	
	int s_no=0;
	String s_pwd=null, s_name=null, s_tel=null, s_email=null;
	if(student != null){
		s_no = student.getS_no();
		s_pwd = student.getS_pwd();
		s_name = student.getS_name();
		s_tel = student.getS_tel();
		s_email = student.getS_email();
	}
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>학적사항</title>
	<script type="text/javascript" src="confirm.js" charset="utf-8" ></script>
</head>
<body>
    <center>
    <form action="hsin0103W.jsp" name="form" method="post">
    <table>
    	<tr>
    		<td>학번:</td>
    		<td><%= s_no %></td>
    	</tr>
    	<tr>
    		<td>이름:</td>
    		<td><%= s_name %></td>
    	</tr>
    
    	<tr>
    		<td>전화번호:</td>
    		<td> <input type="text" name="tel" value="<%= s_tel %>"> </td>
    	</tr>
    	<tr>
    		<td>E-mail:</td>
    		<td> <input type="text" name="email" value="<%= s_email %>"> </td>
    	</tr>
    	<tr>
    		<td>새 비밀번호</td>
    		<td> <input type="password" name="pwd" value="<%= s_pwd %>"> </td>
    	</tr>
    	<tr>
    		<td>새 비밀번호 확인</td>
    		<td> <input type="password" name="pwd2" value="<%= s_pwd %>"> </td>
    	</tr>
    	<tr>
    		<td> 
    			<input type="button" value="수정" onclick="check_ok()"> 
    			<input type="reset" value="되돌리기"> 
    			<input type="button" value="취소" onclick="location.href='hsin0101R.jsp'"> 
    		</td>
    	</tr>
    </table>
    </form>
    </center>
</body>
</html>