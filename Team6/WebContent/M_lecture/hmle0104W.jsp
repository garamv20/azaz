<%@page import="mlecture.M_lectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mlecture.M_lectureDBbean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
        function setParentText(){
             opener.document.getElementById("pInput2").value = document.getElementById("cInput2").value
             opener.document.getElementById("put2").value = document.getElementById("hidden2").value
        }
   	</script>

	<form action="hmle0104W.jsp" method="post" name="fr">
		<center>
			<h1>교수조회</h1>
			<p><input type="text" name="p_name"> <input type="submit" value="조회"></p>
			<%
				if(request.getParameter("p_name")!=null){
					String p_name =request.getParameter("p_name");
					M_lectureDBbean ldb = M_lectureDBbean.getinstance();
					ArrayList<M_lectureBean> list = ldb.profelist(p_name);
					for(int i=0; i<list.size();i++){
						M_lectureBean m = list.get(i);
						%>	
							<%=m.getM_name()%> : 
							<input type="text" id="cInput2" value="<%=m.getP_name()%>">
							<input type="hidden" id="hidden2" value="<%=m.getProfessor_p_no()%>">
							<input type="button" value="전달하기" onclick="setParentText()">
							<br><br>
    						
						<%
					}
				}
			%>
			<input type="button" value="창닫기" onclick="window.close()">
    						<br><br>
		</center>
	</form>
</body>
</html>