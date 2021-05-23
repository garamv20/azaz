<%@page import="java.io.File"%>
<%@page import="notice.NoticeBean"%>
<%@page import="notice.NoticeDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNum = request.getParameter("pageNum");

	int n_no = Integer.parseInt(request.getParameter("n_no"));
	String n_pwd = request.getParameter("n_pwd");
	
	NoticeDBBean db = NoticeDBBean.getInstance();
	
	NoticeBean notice = db.getFileName(n_no);
	String fname = notice.getN_fname();
	
	String saveDirectory = application.getRealPath("/upload");
	String path = saveDirectory + File.separator + fname;
	
	int re = db.deleteNotice(n_no, n_pwd);
	
	if(re == 1){
		if(fname != null){
			File file = new File(path);
			file.delete();
		}
		response.sendRedirect("hmno0103R.jsp?pageNum="+pageNum);
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
			alert("삭제에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>