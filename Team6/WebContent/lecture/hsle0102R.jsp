<%@page import="lecture.LectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lecture.LectureDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 	request.setCharacterEncoding("EUC-KR");
   		String selectke =request.getParameter("selectke"); 
   	    String lecturename =request.getParameter("lecturename");
 %>
<html>
<head>
<meta charset="EUC-KR">
 <link rel="stylesheet" type="text/css" href="style.css">
    <script type="text/javascript" src="lecture1.js" charset="utf-8"></script>
    <title>������б� �л������ý���</title>
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
                    ������б�</h1>
            </div>
            <!-- <nav> -->
                <ul class="main-ul">
                    <li><a href="#">����</a>
                        <ul class="sub-ul">
                            <li><a href="#">��������</a></li>
                            <li><a href="#">������������</a></li>
                        </ul>
                    </li>
                    <li><a href="#">����</a>
                        <ul class="sub-ul">
                            <li><a href="hsle0101R.jsp">������ȸ</a></li>
                            <li><a href="hsle0201W.jsp">������û</a></li>
                            <li><a href="#">������û Ȯ��/����</a></li>
                            <li><a href="hsle0401R.jsp">�ð�ǥ��ȸ</a></li>
                        </ul>
                    </li>
                    <li><a href="#">����</a>
                        <ul class="sub-ul">
                            <li><a href="#">���б� ������ȸ</a></li>
                            <li><a href="#">��ü ������ȸ</a></li>
                        </ul>
                    </li>

                    <li><a href="#">�Խ���</a>
                        <ul class="sub-ul">
                            <li><a href="#">��������</a></li>
                            <li><a href="#">�����Խ���</a></li>
                        </ul>
                    </li>
                </ul>
            <!-- </nav> -->

           <!-- <nav> -->
            <ul class="main-ul">
                <li><a href="#">����</a>
                    <ul class="sub-ul">
                        <li><a href="#">��������</a></li>
                        <li><a href="#">������������</a></li>
                    </ul>
                </li>
                <li><a href="#">����</a>
                    <ul class="sub-ul">
                        <li><a href="#">������ȸ</a></li>
                        <li><a href="#">������û</a></li>
                        <li><a href="#">������û Ȯ��/����</a></li>
                        <li><a href="#">�ð�ǥ��ȸ</a></li>
                    </ul>
                </li>
                <li><a href="#">����</a>
                    <ul class="sub-ul">
                        <li><a href="#">���б� ������ȸ</a></li>
                        <li><a href="#">��ü ������ȸ</a></li>
                    </ul>
                </li>

                <li><a href="#">�Խ���</a>
                    <ul class="sub-ul">
                        <li><a href="#">��������</a></li>
                        <li><a href="#">�����Խ���</a></li>
                    </ul>
                </li>
            </ul>
        <!-- </nav> -->
        </header>
    
    <section>
        <article>
            <div>
                <div class="lhead">
                    <div class="lhead_head">
                    	<form action="hsle0102R.jsp" method="post" name="fr">
                            <p>
                               &nbsp;&nbsp;&nbsp; <strong>Ű���� �˻�</strong>&nbsp;
                               <select name="selectke">
                                   <option value="01">���Ǹ��˻�</option>
                                   <option value="02">�����̸��˻�</option>
                                   <option value="03">���ǹ�ȣ</option>
                                   <option value="04">���ǿ���</option>
                               </select>
                               <input type="text" name="lecturename">
                               <a class="button" onclick="click_ok()">��ȸ</a>  
                           </p>
                       </form>  
                    </div>
                </div>
                <div class="lmain">
                    <table>
                        <tr class="lcolor">
                            
                            <td>���ǹ�ȣ</td>
                            <td>���Ǹ�</td>
                            <td>�г�</td>
                            <td>����</td>
                            <td>��米��</td>
                            <td>���ǿ���</td>
                            <td>���ǽð�</td>
                            <td>���������ο�</td>
                            <td>�̼�����</td>
                        </tr>
            <%
            	// String selectke =request.getParameter("selectke"); 
                                		 // String lecturename =request.getParameter("lecturename");
                                	      lecture.LectureDBBean ldb = lecture.LectureDBBean.getinstance();
                                	      ArrayList<lecture.LectureBean> list = ldb.listKeywords(selectke, lecturename);
                                                for(int i=0;i<list.size();i++){
                                                	lecture.LectureBean llb = list.get(i);
                                               			if(i%2==1){
            %>
                        <tr class="lhover">
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
                       	}%>
                    </table>
                </div>
            </div>
        </article>
    </section>



    
    <footer>
        <ul>
            <li>�λ� �λ����� �߾Ӵ�� 688</li>
            <li>TEL : 051-912-1000</li>
            <li>copyrights (C) KASAN UNIVERSITY. ALL RIGHTS RESERVED</li>
        </ul>
    </footer>
</div>
</body>
</html>