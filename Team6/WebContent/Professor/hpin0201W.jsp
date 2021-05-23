<%@page import="pro.ProfessorBean"%>
<%@page import="pro.ProfessorDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int p_no = Integer.parseInt(request.getParameter("p_no")); //나중에 교수 번호를 request로 받아서 페이지를 넘어가게할예정입니다.
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" media="(min-width:670px)">
<script type="text/javascript" charset="utf-8" src="pro.js"></script>
</head>
<body id="page">
    <div >
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
                <h1><img src="../images//kasanlogo2.jpg" alt="KASAN UNIVERSITY" >
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
                            <li><a href="#">강좌조회</a></li>
                            <li><a href="#">수강신청</a></li>
                            <li><a href="#">수강신청 확인/정정</a></li>
                            <li><a href="#">시간표조회</a></li>
                        </ul>
                    </li>
                    <li><a href="#">성적</a>
                        <ul class="sub-ul">
                            <li><a href="#">현학기 성적조회</a></li>
                            <li><a href="#">전체 성적조회</a></li>
                        </ul>
                    </li>

                    <li><a href="#">게시판</a>
                        <ul class="sub-ul">
                            <li><a href="#">공지사항</a></li>
                            <li><a href="#">자유게시판</a></li>
                        </ul>
                    </li>
                </ul>
            <!-- </nav> -->

        </header>

        <section>
            <article>
                <table class="thead">
                    <div><h1 class="tname">교수정보페이지</h1></div>
                    <tr>
                        <td colspan="2"><img src="../images//zzz.png" width="190px" height="210px"></td>
                    </tr>
                            <%
                            	ProfessorDBBean prodb = ProfessorDBBean.getinstance();
                                                                                    	ProfessorBean pro= prodb.listpro(p_no);
                                                                                    	if(pro != null){
                            %>
                    <tr>
                        <td width="35" height="19">이름</td>
                        <td><%=pro.getP_name() %></td>
                    </tr>
                </table>
                    <span>
                        <span>
                        	<form action="hpin0202W.jsp?p_no=<%=pro.getP_no() %>" method="post" name="fr">
	                            <table class="tbody">
	                                <tr>
	                                    <td>
	                                        교수번호
	                                    </td>
	                                    <td><%=pro.getP_no() %></td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        이름
	                                    </td>
	                                    <td><%=pro.getP_name() %></td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        전공
	                                    </td>
	                                    <td><%
	                                    	String major =prodb.majorname(pro.getMajor_no());
	                                    	out.println(major);
	                                    %></td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        생년월일
	                                    </td>
	                                    <td><%=pro.getP_jumin() %></td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        전화번호
	                                    </td>
	                                    <td><input type="text" name="tel" value="<%=pro.getP_tel() %>" maxlength="13"></td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        이메일
	                                    </td>
	                                    <td><input type="text" name="email" value="<%=pro.getP_email() %>"> </td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        담당강의
	                                    </td>
	                                    <td> <%
	                                       		String lec =prodb.lecturename(pro.getP_no());
	                                    		out.println(lec);
	                                        %></td>
	                                </tr>
	                                <tr>
	                                    <td>
	                                        강의실
	                                    </td>
	                                    <td><%=pro.getP_room() %></td>
	                                </tr>
	                                <%} %>
	                                <tr>
	                                	<td><a class="button" onclick="click_ok()"> 수정완료</a></td>
	                                </tr>
	                            </table>
                            </form>
                        </span>
                    </span>
                </article>
            </section>
            
        <footer id="foot">
            <ul>
                <li>부산 부산진구 중앙대로 688</li>
                <li>TEL : 051-912-1000</li>
                <li>copyrights (C) KASAN UNIVERSITY. ALL RIGHTS RESERVED</li>
            </ul>
        </footer>


    </div>
</body>
</html>