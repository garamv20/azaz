<%@page import="java.io.File"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int bs_id = Integer.parseInt(request.getParameter("bs_id"));

	BoardDBBean db=BoardDBBean.getInstance();
	
	BoardBean board=db.getBoard(bs_id, false);
	//String up = "C:\\Users\\박세준\\OneDrive\\바탕 화면\\그린컴퓨터\\권상구 강사님\\workspace\\magicWebApp\\upload_s\\";
	String up = "C:\\Users\\ParkSeJoon\\OneDrive\\바탕 화면\\그린컴퓨터\\권상구 강사님\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Team6\\upload_s\\";
	String fname = board.getbs_fname();
	System.out.println("@@@### fname ===>"+fname);
	int re = db.ad_deleteBoard(bs_id);
	
	if(re == 1){
		if(fname != null){
			File file=new File(up+fname);
			file.delete();
		}
		response.sendRedirect("hmbo0101R.jsp");
	}else{
%>
		<script language="JavaScript" >
			alert("삭제에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>













