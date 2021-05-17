<%@page import="myUtil.HanConv"%>
<%@page import="member.StudentBean"%>
<%@page import="lecture.lecture1bean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lecture.ScoreDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int lno = Integer.parseInt(request.getParameter("lno"));
	String lname = HanConv.toKor(request.getParameter("lname"));
	int lsem = Integer.parseInt(request.getParameter("lsem"));
	
	ScoreDBBean db = ScoreDBBean.getInstance();
	ArrayList<StudentBean> studentList = db.getStudentList(lno);
	
	int i, s_no=0;
	String s_name="", score="";
%>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../login/style.css">
<title>Insert title here</title>
<body>
    <div id="page">
    <header>
        <div class="top_bg">
        <div class="top-left-header">
            <ul>
                <li><a href="#">HOME</a></li>
                <li><a href="#">LOGOUT</a></li>
            </ul>
        </div>
    </div>
        <div class="logo">
            <h1><img src="../images/kasanlogo2.jpg" alt="KASAN UNIVERSITY" >
                가산대학교</h1>
        </div>

        <ul class="main-ul">
            <li><a href="#">수업</a>
                <ul class="sub-ul">
                    <li><a href="#">강좌조회</a></li>
                    <li><a href="#">시간표조회</a></li>
                </ul>
            </li>
            <li><a href="#">성적</a>
                <ul class="sub-ul">
                    <li><a href="#">학생 조회</a></li>
                    <li><a href="#">성적입력 및 수정</a></li>
                </ul>
            </li>

            <li><a href="#">게시판</a>
                <ul class="sub-ul">
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">자유게시판</a></li>
                </ul>
            </li>
            <li><a href="#">마이페이지</a>
                <ul class="sub-ul">
                    <li><a href="#">개인신상조회</a></li>
                    <li><a href="#">학생조회</a></li>
                </ul>
            </li>
        </ul>
    </header>
    
    <form action="hpsc0103R.jsp?lno=<%=lno%>&lname=<%=lname%>&lsem=<%=lsem%>" method="post">
    	<table border="1" cellspacing="0" width="800">
    		<tr>
		    	<td colspan="5"> 강의명: <%=lname%> </td>
		    </tr>
    		<tr>
    			<th>학번</th>
    			<th>이름</th>
    			<th>중간</th>
    			<th>기말</th>
    			<th>과제</th>
    		</tr>
    		<%
    			for(i=0; i < studentList.size(); i++){
    		    				StudentBean student = studentList.get(i);
    		    				s_no = student.getS_no();
    		    				s_name = student.getS_name();
    		%>
    				<tr>
    					<td><%= s_no %></td>
    					<td><%= s_name %></td>
    					<td> <input type="text" name="midEx<%= i %>"> </td>
    					<td> <input type="text" name="finalEx<%= i %>"> </td>
    					<td> <input type="text" name="task<%= i %>"> </td>
    				</tr>
    		<%
    			}
    		%>
    			<tr>
    				<td> 
    					<input type="submit" value="입력"> 
						    				
    				</td>
    			</tr>
    	</table>
    </form>
    
    <footer>
        <ul>
            <li>부산 부산진구 중앙대로 688</li>
            <li>TEL : 051-912-1000</li>
            <li>copyrights (C) KASAN UNIVERSITY. ALL RIGHTS RESERVED</li>
        </ul>
    </footer>
</div>
</body>
</html>