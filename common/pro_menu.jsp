<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <link rel="stylesheet" type="text/css" href="../style.css">
<title>교직원 메뉴</title>
</head>
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
                <h1><img src="../images/kasanlogo2.jpg" alt="KASAN UNIVERSITY">
                    가산대학교</h1>
            </div>

            <ul class="main-ul">
                <li><a href="#">정보</a>
                    <ul class="sub-ul">
                        <li><a href="../Professor/hpin0101R.jsp">개인정보조회</a></li>
                    </ul>
                </li>
                <li><a href="#">성적</a>
                    <ul class="sub-ul">
                        <li><a href="../pro-score/hpsc0101R.jsp">성적입력 및 수정</a></li>
                    </ul>
                </li>

                <li><a href="hpbo0101R.jsp">게시판</a>
                    <ul class="sub-ul">
                        <li><a href="#">공지사항</a></li>
                        <li><a href="../prof_board/hpbo0101R.jsp">자유게시판</a></li>
                    </ul>
                </li>
            </ul>
        </header>
     </div>
</body>
</html>