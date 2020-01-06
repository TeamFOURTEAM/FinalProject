<%--
  Created by IntelliJ IDEA.
  User: BlackJack21
  Date: 2019-12-10
  Time: 오전 10:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="<c:url value='/resources/css/mypage.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/reset.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.css'/>">
    <title>Title</title>
    <%--    <script src="/resources/UI_PROJECT_RESOURCE/js/login.js"></script>--%>
</head>
<body>
<div class="header">
    <div class="mypage_wrap">
        <a id="cont" href="#">마이페이지
            <i class="fa fa-angle-down"></i>
        </a>
        <div class="mypage" id="mypage">
            <div id="profile" class="profile" name="profile">
                <img src="/resources/images/that.jpg" alt="죽인다...">
                <br> <span>어서오세요 관리자님!</span>
            </div>
            <div id="edit" class="edit" name="profile">
                <input type="button" value="회원 정보수정">
                <input type="button" value="프로필 변경">
            </div>
            <div id="list" class="list" name="profile">
                <div>리스트 목록</div>
                <a><img src="/resources/images/that.jpg"></a>
                <a><img src="/resources/images/that.jpg"></a>
                <a><img src="/resources/images/that.jpg"></a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
