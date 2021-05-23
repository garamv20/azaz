<%@page import="myUtil.HanConv"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int code = Integer.parseInt(request.getParameter("code"));
	String name = HanConv.toKor(request.getParameter("name")); //이름 받을때 한글처리 
	String email = request.getParameter("email");
	
	System.out.println(code + name + email);
	MemberDBBean db = MemberDBBean.getInstance();
	int re = db.findID(code, name, email);
	if(re > 0){
%>
		<script>
			alert('회원님의 아이디는 '+<%= re %>+' 입니다.');
			location.href="hhlg0101R.html";
		</script>
<%
	}else{
%>
		<script>
			alert('입력하신 정보의 회원이 없습니다.');
			history.go(-1);
		</script>
<%
	}
%>
