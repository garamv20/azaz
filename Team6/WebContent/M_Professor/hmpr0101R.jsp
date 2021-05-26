<%@page import="mprofessor.MProfessorBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mprofessor.MProfessorDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	
    	//int m_no = Integer.parseInt( request.getParameter("m_no"));
    	// 관리자 번호가 있어야 실행되게 할 예정
    	request.setCharacterEncoding("EUC-KR");
    %>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="test.css">
<script type="text/javascript" charset="utf-8" src="hmpr.js"></script>
</head>
<body id="page">
    <div>
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
                            <li><a href="hsle0201W.jsp">수강신청</a></li>
                            <li><a href="#">수강신청 확인/정정</a></li>
                            <li><a href="hsle0401R.jsp">시간표조회</a></li>
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
           <div class="shead">
               <p class="shead2">교수관리 → 교수리스트</p>
               <h2 class="shead3">교수 리스트</h2>
           </div>
           <form action="hmpr0101R.jsp" method="post" name="fr">
           <div class="list">
               강의리스트 
               <select name="search">
                   <option value="01">전공검색</option>
                   <option value="02">이름검색</option>
               </select>
               <input type="text" name="lecturename">
			   <input type="submit" value="검색">
           </div>
           </form>
           <div class="lectureadd">
               <a href="hmpr0102R.jsp" class="myButton">교수등록</a>
           </div>
           <table class="sarticle">
               <tr>
               	   <th>전공</th>
                   <th>이름</th>
                   <th>생년월일</th>
                   <th>전화번호</th>
                   <th>EMAIL</th>
                   <th>강의실</th>
                   <th>관리</th>
               </tr>
               <%
               		if(request.getParameter("search")!=null){
               			String selectke= request.getParameter("search");
               			String lecturename = request.getParameter("lecturename");
               			MProfessorDBBean mdb = MProfessorDBBean.getinstance();
               			ArrayList<MProfessorBean> list = mdb.listKeywords(selectke, lecturename);
               			for(int i=0;i<list.size();i++){
                     	   MProfessorBean pro = list.get(i);
                        %>
         	<tr>
         		<td class="sarticle2"><%=pro.getMajor_name() %></td>
         		<td class="sarticle3"><%=pro.getP_name() %></td>
         		<td class="sarticle4" ><%=pro.getP_jumin() %></td>
         		<td class="sarticle5"><%=pro.getP_tel() %></td>
         		<td class="sarticle6"><%=pro.getP_email() %></td>
         		<td class="sarticle7"><%=pro.getP_room() %></td>
         		<td class="sarticle8">
         			<a class="myButton" onclick="location.href='hmpr0106R.jsp?p_no=<%=pro.getP_no()%>'">수정</a> 
         			<a class="myButton" onclick="location.href='hmpr0105R.jsp?p_no=<%=pro.getP_no()%>'">삭제</a>
         		</td>
         	</tr>
         	<%}}else{
         		
         		MProfessorDBBean mpdb = MProfessorDBBean.getinstance();
                ArrayList<MProfessorBean> list= mpdb.prolist();
                for(int i=0;i<list.size();i++){
             	   MProfessorBean pro = list.get(i);
             	   %>
 	<tr>
 		<td class="sarticle2"><%=pro.getMajor_name() %></td>
 		<td class="sarticle3"><%=pro.getP_name() %></td>
 		<td class="sarticle4" ><%=pro.getP_jumin() %></td>
 		<td class="sarticle5"><%=pro.getP_tel() %></td>
 		<td class="sarticle6"><%=pro.getP_email() %></td>
 		<td class="sarticle7"><%=pro.getP_room() %></td>
 		<td class="sarticle8">
 			<a class="myButton" onclick="location.href='hmpr0106R.jsp?p_no=<%=pro.getP_no()%>'">수정</a> 
 			<a class="myButton" onclick="location.href='hmpr0105R.jsp?p_no=<%=pro.getP_no()%>'">삭제</a>
 		</td>
 	</tr>
         		<%}} %>               			
               	
               
               
               
               
           
           </table>
       </article>
    </section>



    
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