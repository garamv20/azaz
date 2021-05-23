<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.BoardBean"%>
<%@page import="com.jspsmart.upload.File"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
<jsp:useBean id="board" class="magic.board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
 --%>
<%
	/*
	Smartupload upload=new Smartupload();
	upload.initialize(pageContext);
	upload.upload();
	File file=upload.getFiles().getFile(0);
	
	String fName=null;
	int fileSize=0;
	
	if(!file.isMissing()){
		fName = file.getFileName();
		file.saveAs("/upload_s/"+file.getFileName());
		fileSize = file.getSize();
	}
	*/
	
	String path=request.getRealPath("upload_s");
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
	
	BoardBean board=new BoardBean();
	
	board.setbs_name(multi.getParameter("bs_name"));
	board.setbs_email(multi.getParameter("bs_email"));
	board.setbs_title(multi.getParameter("bs_title"));
	board.setbs_content(multi.getParameter("bs_content"));
	board.setbs_pwd(multi.getParameter("bs_pwd"));
	board.setbs_ip(ip);
	
	if(file != null){
		board.setbs_fname(file);
		board.setbs_fsize(fileSize);
		board.setbs_rfname(oriFile);
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
	
	board.setbs_date(new Timestamp(System.currentTimeMillis()));
	BoardDBBean db=BoardDBBean.getInstance();
	
	if(db.insertBoard(board) == 1){
		response.sendRedirect("hsbo0101R.jsp");
	}else{
		response.sendRedirect("hsbo0201W.jsp");
	}
%>














