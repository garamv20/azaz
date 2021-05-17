<%@page import="m_notice.NoticeBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="m_notice.NoticeDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
<jsp:useBean id="notice" class="m_notice.NoticeBean"></jsp:useBean>
<jsp:setProperty property="*" name="notice"/>
--%>
<%
	

	String path = request.getRealPath("upload"); //우리가 사용할 upload폴더 지정 
	int size = 1024 * 1024 * 10; //10메가
	int fileSize=0;
	String file = "";
	String oriFile ="";
	
	MultipartRequest multi = new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames(); 	//파일이름 가져옴 
	String str = (String)files.nextElement(); 	//object > String 
	
	file = multi.getFilesystemName(str);
	if(file != null){  //조건없으면 파일안넣은글일때 insert안되고 오류뜸 
		oriFile = multi.getOriginalFileName(str); 	//실제파일이름
		fileSize = file.getBytes().length; 	//파일사이즈 
	}
	
	NoticeBean notice = new NoticeBean();
	
	notice.setN_div(multi.getParameter("n_div"));
	notice.setN_name(multi.getParameter("n_name"));
	notice.setN_email(multi.getParameter("n_email"));
	notice.setN_title(multi.getParameter("n_title"));
	notice.setN_content(multi.getParameter("n_content"));
	notice.setN_pwd(multi.getParameter("n_pwd"));
	
	if(file != null){
		notice.setN_fname(file);
		notice.setN_fsize(fileSize);
		notice.setN_rfname(oriFile);
	}
	
	notice.setN_date(new Timestamp(System.currentTimeMillis()));
	NoticeDBBean db = NoticeDBBean.getInstance();
	
	if(db.insertNotice(notice) == 1){
		response.sendRedirect("hmno0103R.jsp");
	}else{
		response.sendRedirect("hmno1010W.jsp");
	}
%>
