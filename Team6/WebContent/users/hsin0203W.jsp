
<%@page import="kr.co.koo.izone.user.StudentDBBean"%>
<%@page import="kr.co.koo.izone.user.StudentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("utf-8");
	
	//String stu_no =(String)session.getAttribute("세션에서 보내줄 학번");

	int no = 8452;
	//String stu_name =(String)session.getAttribute("세션에서 보내줄 이름");
	
	String stu_pwd = request.getParameter("userPwd");
	String stu_tel = request.getParameter("userTel");
	String stu_email = request.getParameter("userEmail");
	
	
	StudentBean stu = new StudentBean();
	//위 주석 처리된 부분에서 변수명만 들어가면 오류 해결됨
	
	stu.setS_pwd(stu_pwd);            
	stu.setS_tel(stu_tel);
	stu.setS_email(stu_email);
	stu.setS_no(no);
	
	StudentDBBean dao = StudentDBBean.getInstance();
	
	boolean check = dao.updateSTUDENT(stu);
	
	if(check){   //회원정보 수정에 성공, 실패 여부에 따른 결과  
%>	
	<script>
		alert("회원정보가 정상적으로 수정되었습니다.");
		location.href="hs.jsp";
	</script>
<%	
	}else{
%>	
	<script>
		alert("회원정보 수정에 실패했습니다.");
		location.href="hs.jsp";
	</script>
<%
	}
%>