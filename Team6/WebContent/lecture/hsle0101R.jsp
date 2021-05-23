<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
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
            <div>
                <div class="lhead">
                    <div class="lhead_head">
                    	<form action="hsle0102R.jsp" method="post" name="fr">
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
                    </div>
                </div>
                <div class="lmain">
                    <table>
                        <tr class="lcolor">
                            
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
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
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