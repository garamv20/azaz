<%@page import="member.StudentBean"%>
<%@page import="member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int code;
	String id=null;
	if(session.getAttribute("id") != null){
		id = (String)session.getAttribute("id");
		code = ((Integer)(session.getAttribute("code"))).intValue();
	}
	MemberDBBean db = MemberDBBean.getInstance();
	StudentBean student = db.getStudent(id);
	
	int s_no=0, s_level=0, s_status=0, major_no=0;
	String s_pwd=null, s_name=null, s_jumin=null, s_tel=null, s_email=null,status=null;
	if(student != null){
		s_no = student.getS_no();
		s_pwd = student.getS_pwd();
		s_name = student.getS_name();
		s_level = student.getS_level();
		s_jumin = student.getS_jumin();
		s_tel = student.getS_tel();
		s_email = student.getS_email();
		major_no = student.getMAJOR_no();
		s_status = student.getS_status();
		if(s_status == 1){
			status = "재학";
		}else if(s_status == 2){
			status = "휴학";
		}else if(s_status == 3){
			status = "졸업";
		}
	}
	String major = db.getMajorName(id);
	
	
%>
<html>
<head>
<meta charset="UTF-8">
<title>학적사항</title>
	<script type="text/javascript" src="confirm.js" charset="utf-8" ></script>
</head>
<body>
	  <div id="page">
    <header>
        <div class="top_bg">
        <div class="top-left-header">
            <ul>
                <li><a href="../login/hhma01R.jsp">HOME</a></li>
                <li><a href="#">LOGOUT</a></li>
            </ul>
        </div>
    </div>
        <div class="logo">
            <h1><img src="kasanlogo2.jpg" alt="KASAN UNIVERSITY" >
                가산대학교</h1>
        </div>
        
    
       <!-- <nav> -->
        <ul class="main-ul">
            <li><a href="#">학적</a>
                <ul class="sub-ul">
                    <li><a href="#">학적사항</a></li>
                    <li><a href="#">개인정보수정</a></li>
                </ul>
            </li>
            <li><a href="#">수업</a>
                <ul class="sub-ul">
                    <li><a href="../applyLecture/hsle0101R.jsp">강좌조회</a></li>
                    <li><a href="../applyLecture/hsle0201W.jsp">수강신청</a></li>
                    <li><a href="#">수강신청 확인/정정</a></li>
                    <li><a href="../applyLecture/hsle0401R.jsp">시간표조회</a></li>
                </ul>
            </li>
            <li><a href="hssc0101R.jsp" >성적</a>
                <ul class="sub-ul">
                    <li><a href="hssc0201R.jsp">현학기 성적조회</a></li>
                    <li><a href="hssc0101R.jsp">전체 성적조회</a></li>
                </ul>
            </li>
            
            <li><a href="#">게시판</a>
                <ul class="sub-ul">
                    <li><a href="../notice/hsno0101R.jsp">공지사항</a></li>
                    <li><a href="../stu_board/hsbo0101R.jsp"></a></li>
                </ul>
            </li>
        </ul>
    </header>
    
    <table>
    	<tr>
    		<td>학번:</td>
    		<td><%= s_no %></td>
    	</tr>
    	<tr>
    		<td>이름:</td>
    		<td><%= s_name %></td>
    	</tr>
    	<tr>
    		<td>학적:</td>
    		<td><%= status %></td>
    	</tr>
    	<tr>
    		<td>전공:</td>
    		<td><%= major %></td>
    	</tr>
    	<tr>
    		<td>학년:</td>
    		<td><%= s_level %></td>
    	</tr>
    	<tr>
    		<td>생년월일:</td>
    		<td><%= s_jumin.substring(0, 2)+"."+s_jumin.substring(2,4)+"."+s_jumin.substring(4,6) %></td>
    	</tr>
    	<tr>
    		<td>전화번호:</td>
    		<td><%= s_tel %></td>
    	</tr>
    	<tr>
    		<td>E-mail</td>
    		<td><%= s_email %></td>
    	</tr>
    	<tr>
    		<td> <input type="button" value="수정" onclick="confirm(<%= s_pwd%>)"> </td>
    	</tr>
    </table>
    
    
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