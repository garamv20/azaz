<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="board" class="magic.board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	board.setB_id(b_id);
	//edit.jsp에서 쿼리스트링으로 b_id던져서 위의 두줄 없어도 b_id 들어가서 수정된다. 
	
	BoardDBBean db = BoardDBBean.getInstance();
	int re = db.editBoard(board);
	
	if(re == 1){
		response.sendRedirect("list.jsp");
	}else if(re == 0){
%>
		<script language="JavaScript">
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);  
		</script>
<%
	}else if(re == -1){
%>
		<script language="JavaScript">
			alert("수정에 실패하였습니다.");
			history.go(-1);  
		</script>
<%	
	}
%>
