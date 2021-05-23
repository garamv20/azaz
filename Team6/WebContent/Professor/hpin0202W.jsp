<%@page import="pro.ProfessorDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	int p_no = Integer.parseInt(request.getParameter("p_no"));
	
	ProfessorDBBean pro = ProfessorDBBean.getinstance();
	int re = pro.updatepro(tel, email, p_no);
	
	if(re==1){
		response.sendRedirect("hpin0101R.jsp?="+p_no);
	}else{
		response.sendRedirect("hpin0101R.jsp?="+p_no);
	}
%>