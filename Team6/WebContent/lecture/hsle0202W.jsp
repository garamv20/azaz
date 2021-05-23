<%@page import="java.util.ArrayList"%>
<%@page import="lecture.LectureBean"%>
<%@page import="lecture.LectureDBBean"%>
<%@page import="lecture.LectureBean"%>
<%@page import="lecture.LectureDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	//학생 코드 request 로 받을거
                   		 int s_no = 20180001;
                    	request.setCharacterEncoding("EUC-KR");
                		String selectke =request.getParameter("selectke"); 
                	    String lecturename =request.getParameter("lecturename");
    %>
<html>
<head>
<meta charset="EUC-KR">
 <link rel="stylesheet" type="text/css" href="style.css">
    <script type="text/javascript" src="lecture1.js" charset="utf-8"></script>
    <title>가산대학교 학생지원시스템</title>
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
                <h1><img src="image/kasanlogo2.jpg" alt="KASAN UNIVERSITY" >
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
                             <li><a href="hsle0101R.jsp">강좌조회</a></li>
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
                        <li><a href="test.jsp">시간표조회</a></li>
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
            <div>
                <div class="lhead">
                    <div class="lhead_head2">
                    <form action="hsle0202W.jsp" method="post" name="fr1">
                            <p>
                               &nbsp;&nbsp;&nbsp; <strong>키워드 검색</strong>&nbsp;
                               <select name="selectke">
                                   <option value="01">강의명검색</option>
                                   <option value="02">교수이름검색</option>
                                   <option value="03">강의번호</option>
                                   <option value="04">강의요일</option>
                               </select>
                               <input type="text" name="lecturename">
                               <a class="button" onclick="click_ok()">조회</a>  
                           </p>
                       </form> 
                    	<form action="hsle0202W.jsp" method="post" name="fr">
	                        <p>
	                            &nbsp;&nbsp;&nbsp; <strong>개설과목 검색</strong>&nbsp;
	                            <select id="luni01" name="major_no" >
	                            		<option value="11">컴퓨터공학과</option>
		                                <option value="12">재료학과</option>
		                                <option value="13">체육학과</option>
	                            </select>
	                            <a class="button" onclick="click_ok()">검색</a>  
	                        </p>
                        </form>
                         
                    </div>
                </div>
                <div class="lmain" style="width:100%; height:500px;	 overflow:auto">
                    <table style="width:100%;  border="0" overflow:auto">
                        <tr class="lcolor">
                            <td>신청</td>
                            <td>강의번호</td>
                            <td>강의명</td>
                            <td>학년</td>
                            <td>학점</td>
                            <td>담당교수</td>
                            <td>강의요일</td>
                            <td>강의시간</td>
                            <td>수강가능인원</td>
                            <td>이수구분</td>
                        </tr>
                        <%
                        	//데이터베이스에 있는 데이터들을 불러오기 위해 만든 강의 코드입니다.
                                                                                                                        lecture.LectureDBBean lb2 = lecture.LectureDBBean.getinstance();
                                                                                                                        ArrayList<lecture.LectureBean> list;
                                                                                                                        if(selectke ==null){
                                                                                                                        int major_no = Integer.parseInt(request.getParameter("major_no"));
                                                                                                                        list= lb2.listlecture(major_no);
                                                                                                                        }else{
                                                                                                                        list = lb2.listKeywords(selectke, lecturename);
                                                                                                                        }
                                                                                                                        lecture.LectureBean llb=null;
                                                                                                                        	for(int i=0;i<list.size();i++){
                                                                                                                        	 llb = list.get(i);
                                                                                                                       			if(i%2==1){
                        %>
                        <tr class="lhover">
                            <td><a class="button" onclick="location.href='hsle0204W.jsp?l_no=<%=llb.getL_no()%>&major_no=<%=llb.getMajor_no()%>'">신청</a></td>
                            <td><%=llb.getL_no()%></td>
							<td><%=llb.getL_name()%></td>
							<td><%=llb.getL_level()%></td>
							<td><%=llb.getL_unit()%></td>
							<td><%=llb.getMajor_no()%></td>
							<td><%=llb.getL_day()%></td>
							<td><%=llb.getL_start()%></td>
							<td><%=llb.getL_max()%></td>
							<td><%=llb.getL_com()%></td>
                        </tr>
<%
	}else{
%>
							<tr class="lhover2">
                            <td><a class="button" onclick="location.href='hsle0204W.jsp?l_no=<%=llb.getL_no()%>&major_no=<%=llb.getMajor_no()%>'">신청</a></td>
                            <td><%=llb.getL_no()%></td>
							<td><%=llb.getL_name()%></td>
							<td><%=llb.getL_level()%></td>
							<td><%=llb.getL_unit()%></td>
							<td><%=llb.getMajor_no()%></td>
							<td><%=llb.getL_day()%></td>
							<td><%=llb.getL_start()%></td>
							<td><%=llb.getL_max()%></td>
							<td><%=llb.getL_com()%></td>
                        </tr>
<%
	}
                       	}
%>
                    </table>
                </div>
                <div class="lmain2">
                    <div class="lmain2_head">
                     <%
                     	lecture.LectureDBBean lb3 = lecture.LectureDBBean.getinstance();
                                                                                                         	lecture.LectureBean lt= lb3.semlecture(s_no);
                     %>   
                        <strong>수강확정내역</strong>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        잔여학점 : <%
                        	int limit =19;
                                                                                                                        if(lt.getL_sem()>limit){
                        %>
	                    	 		<script>
	                    	 			alert("신청 학점이 초과 되었습니다.");
	                    	 		</script>
	                    	 <%
	                    	 	}else{
	                    	 	                    	 	                    	 	                    	                         	limit = limit - lt.getL_sem();
	                    	 	                    	 	                    	 	                    	                         	out.println(limit);                        
	                    	 	                    	 	                    	 	                    	 	                     }
	                    	 %>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        신청학점 : 
                     <%=lt.getL_sem()%>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        최대수강학점 : 19
                    </div>
                    
                    <div class="lmain2_main">
                        <table>
                            <tr class="lcolor">
                            	<td>삭제</td>
                                <td>강의번호</td>
                                <td>강의명</td>
                                <td>학년</td>
                                <td>학점</td>
                                <td>담당교수</td>
                                <td>강의요일</td>
                                <td>강의시간</td>
                                <td>잔여석</td>
                                <td>비고</td>
                            </tr>
                           	  <%
                           	  	lecture.LectureDBBean lb1=lecture.LectureDBBean.getinstance();
                           	                             	                             	                             	                               ArrayList<lecture.LectureBean> view= lb1.viewlecture(s_no);
                           	                             	                             	                             	  																for(int i=0;i<view.size();i++){
                           	                             	                             	                             	          																	lecture.LectureBean lb = view.get(i);
                           	                             	                             	                             	          																	if(i%2==1){
                           	  %>
	                            <tr class="lhover">
	                            	<td><a class="button"  onclick="location.href='hsle0203W.jsp?l_no=<%=lb.getL_no()%>&major_no=<%=lb.getMajor_no()%>'">삭제</a></td>
	                           		<td><%=lb.getL_no()%></td>
									<td><%=lb.getL_name()%></td>
									<td><%=lb.getL_level()%></td>
									<td><%=lb.getL_unit()%></td>
									<td><%=lb.getProfessor_p_no()%></td>
									<td><%=lb.getL_day()%></td>
									<td><%=lb.getL_start()%></td>
									<td><%=lb.getL_max()%></td>
									<td></td>
	                            </tr>
                            <%}else{%>
                            	<tr class="lhover2">
                                <td><a class="button" onclick="location.href='hsle0203W.jsp?l_no=<%=lb.getL_no()%>&major_no=<%=lb.getMajor_no()%>'">삭제</a></td>
                                <td><%=lb.getL_no()%></td>
								<td><%=lb.getL_name()%></td>
								<td><%=lb.getL_level()%></td>
								<td><%=lb.getL_unit()%></td>
								<td><%=lb.getProfessor_p_no()%></td>
								<td><%=lb.getL_day()%></td>
								<td><%=lb.getL_start()%></td>
								<td><%=lb.getL_max() %></td>
								<td></td>
                            </tr><%
                            	}	
                            }%>
                          
                        </table>
                    </div>
                </div>
            </div>
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



