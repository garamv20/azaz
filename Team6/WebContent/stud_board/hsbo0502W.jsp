<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="board" class="board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	//int b_id = Integer.parseInt(request.getParameter("b_id"));
	//board.setB_id(b_id);
	
	BoardDBBean db=BoardDBBean.getInstance();
	int re = db.editBoard(board);
	
	if(re == 1){
		response.sendRedirect("hsbo0101R.jsp");
	}else if(re == 0){
%>
		<script language="JavaScript" >
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%
	}else if(re == -1){
%>
		<script language="JavaScript" >
			alert("수정에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
%>

















