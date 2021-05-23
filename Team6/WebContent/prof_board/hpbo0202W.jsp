<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardBean2"%>
<%@page import="com.jspsmart.upload.File"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDBBean2"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
<jsp:useBean id="board" class="magic.board.BoardBean2"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
 --%>
<%
	/*
	SmartUpload upload=new SmartUpload();
	upload.initialize(pageContext);
	upload.upload();
	File file=upload.getFiles().getFile(0);
	
	String fName=null;
	int fileSize=0;
	
	if(!file.isMissing()){
		fName = file.getFileName();
		file.saveAs("/upload/"+file.getFileName());
		fileSize = file.getSize();
	}
	*/
	
	String path=request.getRealPath("upload_p");
	int size=1024 * 1024 * 10;
	int fileSize=0;
	String file="";
	String oriFile="";
	
	MultipartRequest multi = new MultipartRequest(request, path, size, "EUC-KR", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String str = (String)files.nextElement();
	file = multi.getFilesystemName(str);
	
	//oriFile = multi.getOriginalFileName(str);
	//fileSize = file.getBytes().length;
	
	if(file != null){
		oriFile = multi.getOriginalFileName(str);
		fileSize = file.getBytes().length;
	}
	
	InetAddress address=InetAddress.getLocalHost();
	String ip = address.getHostAddress();
	//board.setB_ip(request.getRemoteAddr());
	
	BoardBean2 board=new BoardBean2();
	
	board.setBp_name(multi.getParameter("bp_name"));
	board.setBp_email(multi.getParameter("bp_email"));
	board.setBp_title(multi.getParameter("bp_title"));
	board.setBp_content(multi.getParameter("bp_content"));
	board.setBp_pwd(multi.getParameter("bp_pwd"));
	board.setBp_ip(ip);
	
	if(file != null){
		board.setBp_fname(file);
		board.setBp_fsize(fileSize);
		board.setBp_rfname(oriFile);
	}
	
	/*
	board.setB_name(upload.getRequest().getParameter("b_name"));
	board.setB_email(upload.getRequest().getParameter("b_email"));
	board.setB_title(upload.getRequest().getParameter("b_title"));
	board.setB_content(upload.getRequest().getParameter("b_content"));
	board.setB_pwd(upload.getRequest().getParameter("b_pwd"));
	board.setB_ip(ip);
	board.setB_fname(fName);
	board.setB_fsize(fileSize);
	*/
	
	board.setBp_date(new Timestamp(System.currentTimeMillis()));
	BoardDBBean2 db=BoardDBBean2.getInstance();
	
	if(db.insertBoard(board) == 1){
		response.sendRedirect("hpbo0101R.jsp");
	}else{
		response.sendRedirect("hpbo0201W.jsp");
	}
%>














