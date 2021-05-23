<%@page import="lecture.LectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lecture.LectureDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	//데이터 인설트 하는코드
	int s_no = 1; //학생번호 받아올예정
	int l_no = Integer.parseInt(request.getParameter("l_no"));
	int major_no = Integer.parseInt(request.getParameter("major_no"));
	lecture.LectureDBBean dbbean = lecture.LectureDBBean.getinstance();
	if(dbbean.confirmlecture(l_no)==1){
%>
		<script>
			alert("신청 강의가 중복 되었습니다.");
			history.back();  
		</script>
<%	
	}else{
		int re=	dbbean.insertlecture(s_no, l_no);
		if(re==1){
			dbbean.maxlecture(l_no);
			response.sendRedirect("hsle0202W.jsp?major_no="+major_no);		
		}else{
		%>
			<script>
				alert("신청 실패");
				history.back(); 
			</script>
		<%	
	}
}
%>

