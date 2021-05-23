<%@page import="lecture.ScoreDBBean"%>
<%@page import="myUtil.HanConv"%>
<%@page import="lecture.ExamBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int l_no = Integer.parseInt(request.getParameter("l_no"));
	String l_name = HanConv.toKor(request.getParameter("l_name"));
	
	//성적확정유무 확인
	int isConfirm = 0;
	if(request.getParameter("isConfirm") != null){
		isConfirm = 1;
	}
	System.out.println("@@@@@@@@@@"+l_no+"  @@@@@@"+l_name);
	
	ScoreDBBean db = ScoreDBBean.getInstance();
	ArrayList<ExamBean> examList = db.getExamList(l_no);
	int i, s_no=0, midEx=0, finalEx=0, task=0, total=0; 
	String s_name="", score="";
%>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../login/style.css">
<title>Insert title here</title>
	<script type="text/javascript" src="score.js" charset="UTF-8" ></script>
</head>
<style type="text/css">
		td{padding: 5px}
	</style>
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

	<table border="1">
		<tr>
		    <td colspan="7"> 강의명: <%=l_name%> </td>
		</tr>
    	<tr>
    		<th>학번</th>
    		<th>이름</th>
    		<th>중간</th>
    		<th>기말</th>
    		<th>과제</th>
    		<th>합계</th>
    		<th>성적</th>
    	<% 
    		if(isConfirm != 1){
    	%>
    		<th></th>
    	<%
    		}
    	%>
    	</tr>
    	<%
    		for(i=0; i< examList.size(); i++){
    			ExamBean exam = examList.get(i);
    			s_no = exam.getS_no();
    			s_name = exam.getS_name();
    			midEx = exam.getMidEx();
    			finalEx = exam.getFinalEx();
    			task = exam.getTask();
    			total = exam.getTotal();
    			score = exam.getScore();
    	%>
    		<tr>
    			<td> <%= s_no %> </td>
    			<td> <%= s_name %> </td>
    			<td> <%= midEx %> </td>
    			<td> <%= finalEx %> </td>
    			<td> <%= task %> </td>
    			<td> <%= total %> </td>
    			<td> <%= score %> </td>
    	<% 
    		if(isConfirm != 1){
    	%>
    			<td> <input type="button" value="수정" onclick="location.href='hpsc0201W.jsp?s_no=<%= s_no%>&l_no=<%=l_no%>'"> </td>
    	<%
    		}
    	%>
    		</tr>
    	<%
    		}
    	%>
	</table>
	<% 
    		if(isConfirm != 1){
    	%>
			<input type="button" value="성적 확정" onclick="location.href='hpsc0301W.jsp?l_no=<%= l_no %>'">
    	<%
    		}
    	%>
	<input type="button" value="처음으로" onclick="location.href='hpsc0101R.jsp'">
	
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