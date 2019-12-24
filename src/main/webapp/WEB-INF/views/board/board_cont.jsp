<%--
  Created by IntelliJ IDEA.
  User: BlackJack21
  Date: 2019-12-24
  Time: 오후 1:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/board_cont/board_cont.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <title>게시판 내용</title>
</head>
<body>
<div id="bigcontainer">
    <div id="container">
        <div class="head">
            <h1>좋은 주인분 찾습니다</h1>
        </div>
        <div class="wrap">
            <div class="title">제목:${title}</div>
            <div class="id"><span class="left">아이디:${id}</span>&nbsp;<span class="right">날짜:${date}</span></div>
            <div class="cont">내용:${cont}</div>
        </div>
    </div>
</div>
</body>
</html>
