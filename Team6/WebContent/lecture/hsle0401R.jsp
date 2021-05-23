<%@page import="java.util.Random"%>
<%@page import="lecture.LectureBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lecture.LectureDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <html>
<head>
<meta charset="EUC-KR">
 <link rel="stylesheet" type="text/css" href="style.css">
    <script type="text/javascript" src="lecture1.js" charset="utf-8"></script>
    <title>시간표</title>
<style>
#sceline{
	border-top:1px solid blue; 
}
.sce1{	
	margin:0 auto;
	border: 2px solid #d2d2d2;
	border-collapse: collapse;
	font-size: 0.9em;
}
.sce1 th, td{
	border: 1px solid #d2d2d2;
	border-collapse: collapse;
}
.sce1 th{
	height: 5px;
}
.sce1 td {
	width: 75px;
	height: 60px;
	font-weight: bold;
}
</style>
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
        </header>
<%
	int s_no =1;
	lecture.LectureDBBean ldb = lecture.LectureDBBean.getinstance();
	ArrayList<lecture.LectureBean> list = ldb.listSce(s_no);
	String[] mon = {" "," "," "," "," "," "," "," "," "};
	String[] tue= {" "," "," "," "," "," "," "," "," "};
	String[] wed = {" "," "," "," "," "," "," "," "," "};
	String[] thu= {" "," "," "," "," "," "," "," "," "};
	String[] fri= {" "," "," "," "," "," "," "," "," "};
	String[] color = {"#ecc369","#f08676","#70a5e9","#75ca87","#d397ed","#a6c96f","#7ad1c0","#fbaa69","#9d86e0"
	,"#CD5C5C","#7FFFD4","#00FFFF","#FF0000","#00FF00	","#FFFAF0","#708090",	"#BDB76B","#2E8B57	","#FFFF00"
	,"#DCDCDC","#20B2AA","#FF00FF","#FFF8DC","#9370DB","#87CEFA"};
	String[] mon2 = {" "," "," "," "," "," "," "," "," "};
	String[] tue2= {" "," "," "," "," "," "," "," "," "};
	String[] wed2 = {" "," "," "," "," "," "," "," "," "};
	String[] thu2= {" "," "," "," "," "," "," "," "," "};
	String[] fri2= {" "," "," "," "," "," "," "," "," "};
	Random rd = new Random();
	for(int i=0;i<list.size();i++){
		int num = rd.nextInt(24);
		lecture.LectureBean llb=list.get(i);
		if(llb.getL_day().equals("월")&&llb.getL_start()==9){
	mon[0] = llb.getL_name();
	mon2[0] = color[num];
		}
		if(llb.getL_day().equals("화")&&llb.getL_start()==9){
	tue[0] = llb.getL_name();
	tue2[0] = color[num];
		}
		if(llb.getL_day().equals("수")&&llb.getL_start()==9){
	wed[0] = llb.getL_name();
	wed2[0] = color[num];
		}
		if(llb.getL_day().equals("목")&&llb.getL_start()==9){
	thu[0] = llb.getL_name();
	thu2[0] = color[num];
		}
		if(llb.getL_day().equals("금")&&llb.getL_start()==9){
	fri[0] = llb.getL_name();
	fri2[0] = color[num];
		}
		if(llb.getL_day().equals("월")&&llb.getL_start()==10){
	mon[1] = llb.getL_name();
	mon2[1] = color[num];
		}
		if(llb.getL_day().equals("화")&&llb.getL_start()==10){
	tue[1] = llb.getL_name();
	tue2[1] = color[num];
		}
		if(llb.getL_day().equals("수")&&llb.getL_start()==10){
	wed[1] = llb.getL_name();
	wed2[1] = color[num];
		}
		if(llb.getL_day().equals("목")&&llb.getL_start()==10){
	thu[1] = llb.getL_name();
	thu2[1] = color[num];
		}
		if(llb.getL_day().equals("금")&&llb.getL_start()==10){
	fri[1] = llb.getL_name();
	fri2[1] = color[num];
		}
		if(llb.getL_day().equals("월")&&llb.getL_start()==11){
	mon[2] = llb.getL_name();
	mon2[2] = color[num];
		}
		if(llb.getL_day().equals("화")&&llb.getL_start()==11){
	tue[2] = llb.getL_name();
	tue2[2] = color[num];
		}
		if(llb.getL_day().equals("수")&&llb.getL_start()==11){
	wed[2] = llb.getL_name();
	wed2[2] = color[num];
		}
		if(llb.getL_day().equals("목")&&llb.getL_start()==11){
	thu[2] = llb.getL_name();
	thu2[2] = color[num];
		}
		if(llb.getL_day().equals("금")&&llb.getL_start()==11){
	fri[2] = llb.getL_name();
	fri2[2] = color[num];
		}
		if(llb.getL_day().equals("월")&&llb.getL_start()==12){
	mon[3] = llb.getL_name();
	mon2[3] = color[num];
		}
		if(llb.getL_day().equals("화")&&llb.getL_start()==12){
	tue[3] = llb.getL_name();
	tue2[3] = color[num];
		}
		if(llb.getL_day().equals("수")&&llb.getL_start()==12){
	wed[3] = llb.getL_name();
	wed2[3] = color[num];
		}
		if(llb.getL_day().equals("목")&&llb.getL_start()==12){
	thu[3] = llb.getL_name();
	thu2[3] = color[num];
		}
		if(llb.getL_day().equals("금")&&llb.getL_start()==12){
	fri[3] = llb.getL_name();
	fri2[3] = color[num];
		}
		if(llb.getL_day().equals("월")&&llb.getL_start()==13){
	mon[4] = llb.getL_name();
	mon2[4] = color[num];
		}
		if(llb.getL_day().equals("화")&&llb.getL_start()==13){
	tue[4] = llb.getL_name();
	tue2[4] = color[num];
		}
		if(llb.getL_day().equals("수")&&llb.getL_start()==13){
	wed[4] = llb.getL_name();
	wed2[4] = color[num];
		}
		if(llb.getL_day().equals("목")&&llb.getL_start()==13){
	thu[4] = llb.getL_name();
	thu2[4] = color[num];
		}
		if(llb.getL_day().equals("금")&&llb.getL_start()==13){
	fri[4] = llb.getL_name();
	fri2[4] = color[num];
		}
		if(llb.getL_day().equals("월")&&llb.getL_start()==14){
	mon[5] = llb.getL_name();
	mon2[5] = color[num];
		}
		if(llb.getL_day().equals("화")&&llb.getL_start()==14){
	tue[5] = llb.getL_name();
	tue2[5] = color[num];
		}
		if(llb.getL_day().equals("수")&&llb.getL_start()==14){
	wed[5] = llb.getL_name();
	wed2[5] = color[num];
		}
		if(llb.getL_day().equals("목")&&llb.getL_start()==14){
	thu[5] = llb.getL_name();
	thu2[5] = color[num];
		}
		if(llb.getL_day().equals("금")&&llb.getL_start()==14){
	fri[5] = llb.getL_name();
	fri2[5] = color[num];
		}
		if(llb.getL_day().equals("월")&&llb.getL_start()==15){
	mon[6] = llb.getL_name();
	mon2[6] = color[num];
		}
		if(llb.getL_day().equals("화")&&llb.getL_start()==15){
	tue[6] = llb.getL_name();
	tue2[6] = color[num];
		}
		if(llb.getL_day().equals("수")&&llb.getL_start()==15){
	wed[6] = llb.getL_name();
	wed2[6] = color[num];
		}
		if(llb.getL_day().equals("목")&&llb.getL_start()==15){
	thu[6] = llb.getL_name();
	thu2[6] = color[num];
		}
		if(llb.getL_day().equals("금")&&llb.getL_start()==15){
	fri[6] = llb.getL_name();
	fri2[6] = color[num];
		}
		if(llb.getL_day().equals("월")&&llb.getL_start()==16){
	mon[7] = llb.getL_name();
	mon2[7] = color[num];
		}
		if(llb.getL_day().equals("화")&&llb.getL_start()==16){
	tue[7] = llb.getL_name();
	tue2[7] = color[num];
		}
		if(llb.getL_day().equals("수")&&llb.getL_start()==16){
	wed[7] = llb.getL_name();
	wed2[7] = color[num];
		}
		if(llb.getL_day().equals("목")&&llb.getL_start()==16){
	thu[7] = llb.getL_name();
	thu2[7] = color[num];
		}
		if(llb.getL_day().equals("금")&&llb.getL_start()==16){
	fri[7] = llb.getL_name();
	fri2[7] = color[num];
		}
		if(llb.getL_day().equals("월")&&llb.getL_start()==17){
	mon[8] = llb.getL_name();
	mon2[8] = color[num];
		}
		if(llb.getL_day().equals("화")&&llb.getL_start()==17){
	tue[8] = llb.getL_name();
	tue2[8] = color[num];
		}
		if(llb.getL_day().equals("수")&&llb.getL_start()==17){
	wed[8] = llb.getL_name();
	wed2[8] = color[num];
		}
		if(llb.getL_day().equals("목")&&llb.getL_start()==17){
	thu[8] = llb.getL_name();
	thu2[8] = color[num];
		}
		if(llb.getL_day().equals("금")&&llb.getL_start()==17){
	fri[8] = llb.getL_name();
	fri2[8] = color[num];
		}
	}
%>
<div id="sceline">
<table class="sce1" width=400 height="600" style="color: #121212">
<caption><h1>▶   강의 시간표  ◀</h1></caption>
  <tr width=19% >
    <th></th>
    <th>월</th>
    <th>화</th>
    <th>수</th>
    <th>목</th>
    <th>금</th>
  </tr>
  <tr>
			<th>9</th>
			<td style="background-color: <%=mon2[0]%>"><%=mon[0] %></td>
			<td style="background-color: <%=tue2[0]%>"><%=tue[0]%></td>
			<td style="background-color: <%=wed2[0]%>"><%=wed[0] %></td>
			<td style="background-color: <%=thu2[0]%>"><%=thu[0] %></td>
			<td style="background-color: <%=fri2[0]%>"><%=fri[0] %></td>
		</tr>
		<tr>
			<th>10</th>
			<td style="background-color: <%=mon2[1]%>"><%=mon[1] %></td>
			<td style="background-color: <%=tue2[1]%>"><%=tue[1]%></td>
			<td style="background-color: <%=wed2[1]%>"><%=wed[1] %></td>
			<td style="background-color: <%=thu2[1]%>"><%=thu[1] %></td>
			<td style="background-color: <%=fri2[1]%>"><%=fri[1] %></td>
		</tr>
		<tr>
			<th>11</th>
			<td style="background-color: <%=mon2[2]%>"><%=mon[2] %></td>
			<td style="background-color: <%=tue2[2]%>"><%=tue[2]%></td>
			<td style="background-color: <%=wed2[2]%>"><%=wed[2] %></td>
			<td style="background-color: <%=thu2[2]%>"><%=thu[2] %></td>
			<td style="background-color: <%=fri2[2]%>"><%=fri[2] %></td>
		</tr>
		<tr>
			<th>12</th>
			<td style="background-color: <%=mon2[3]%>"><%=mon[3] %></td>
			<td style="background-color: <%=tue2[3]%>"><%=tue[3]%></td>
			<td style="background-color: <%=wed2[3]%>"><%=wed[3] %></td>
			<td style="background-color: <%=thu2[3]%>"><%=thu[3] %></td>
			<td style="background-color: <%=fri2[3]%>"><%=fri[3] %></td>
		</tr>
		<tr>
			<th>13</th>
			<td style="background-color: <%=mon2[4]%>"><%=mon[4] %></td>
			<td  style="background-color: <%=tue2[4]%>"><%=tue[4]%></td>
			<td style="background-color: <%=wed2[4]%>"><%=wed[4] %></td>
			<td style="background-color: <%=thu2[4]%>"><%=thu[4] %></td>
			<td style="background-color: <%=fri2[4]%>"><%=fri[4] %></td>
		</tr>
		<tr>
			<th>14</th>
			<td style="background-color: <%=mon2[5]%>"><%=mon[5] %></td>
			<td  style="background-color: <%=tue2[5]%>"><%=tue[5]%></td>
			<td style="background-color: <%=wed2[5]%>"><%=wed[5] %></td>
			<td style="background-color: <%=thu2[5]%>"><%=thu[5] %></td>
			<td style="background-color: <%=fri2[5]%>"><%=fri[5] %></td>
		</tr>
		<tr>
			<th>15</th>
			<td style="background-color: <%=mon2[6]%>"><%=mon[6] %></td>
			<td  style="background-color: <%=tue2[6]%>"><%=tue[6]%></td>
			<td style="background-color: <%=wed2[6]%>"><%=wed[6] %></td>
			<td style="background-color: <%=thu2[6]%>"><%=thu[6] %></td>
			<td style="background-color: <%=fri2[6]%>"><%=fri[6] %></td>
		</tr>
		<tr>
			<th>16</th>
			<td style="background-color: <%=mon2[7]%>"><%=mon[7] %></td>
			<td  style="background-color: <%=tue2[7]%>"><%=tue[7]%></td>
			<td style="background-color: <%=wed2[7]%>"><%=wed[7] %></td>
			<td style="background-color: <%=thu2[7]%>"><%=thu[7] %></td>
			<td style="background-color: <%=fri2[7]%>"><%=fri[7] %></td>
		</tr>
		<tr>
			<th>17</th>
			<td style="background-color: <%=mon2[8]%>"><%=mon[8] %></td>
			<td  style="background-color: <%=tue2[8]%>"><%=tue[8]%></td>
			<td style="background-color: <%=wed2[8]%>"><%=wed[8] %></td>
			<td style="background-color: <%=thu2[8]%>"><%=thu[8] %></td>
			<td style="background-color: <%=fri2[8]%>"><%=fri[8] %></td>
		</tr>
</table>
</div>
</html>