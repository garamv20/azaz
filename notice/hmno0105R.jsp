<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="m_notice.NoticeBean"%>
<%@page import="m_notice.NoticeDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int n_no = Integer.parseInt(request.getParameter("fileN"));
		NoticeDBBean db = NoticeDBBean.getInstance();
		NoticeBean notice = db.getFileName(n_no);
		
		String filename="";
		String realFilename="";
		
		if(notice != null){
			filename = notice.getN_fname();
			realFilename = notice.getN_rfname(); //실제파일이름 
		}
		
		//파일이름에 해당하는 경로설정 
		String saveDirectory = application.getRealPath("/upload");
		String path = saveDirectory + File.separator + filename;  //경로 + 파일이름 
		
		File file = new File(path);
		long length = file.length(); //파일길이 
		realFilename = new String(realFilename.getBytes("ms949"),"8859_1"); //한글처리 
		
		response.setContentType("application/octet-stream");
		response.setContentLength((int)length);
		response.setHeader("Content-Disposition", "attachment;filename=" + realFilename);
		
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
		out.clear();
		out = pageContext.pushBody();
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream()); //출력
		
		int data;
		while((data=bis.read()) != -1){
			bos.write(data);
			bos.flush();
		}
		
		bis.close();
		bos.close();
	%>
</body>
</html>