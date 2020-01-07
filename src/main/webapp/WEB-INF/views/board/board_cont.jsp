<%--
  Created by IntelliJ IDEA.
  User: BlackJack21
  Date: 2019-12-24
  Time: 오후 1:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/board_cont/board_cont.css">
    <link rel="stylesheet" href="/resources/css/reset.css">

    <script type="text/javascript" src="/resources/js/board_cont/board_cont.js"></script>

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
            <c:if test="${member_id==id}">
                <div class="controller">
                    <a href="user_board_list?page=${page}" >목록</a>
                    <a href="user_board_list_del?back_end_list_no=${no}" onclick="return del_ok();">삭제</a>
                    <a href="user_board_update?back_end_list_no=${no}" >수정</a>
                </div>
            </c:if>
        </div>

        <c:if test="${empty blist}">
            <div> 댓글 목록이 없습니다</div>
        </c:if>
        <c:if test="${!empty blist}">
            <c:forEach var="b" items="${blist}">
                <div class="reply_list_div" id="reply_list_div">
                    <div class="rep">
                        <h4>${b.back_end_list_id}</h4>
                        <h5>${b.back_end_list_date}</h5>
                    </div>
                    <div class="reply_cont">
                            ${b.back_end_list_cont}
                    </div>
                    <c:if test="${member_id==b.back_end_list_id}">
                        <div class="reply_input">
                            <a href="#" >수정</a>
                            <a href="#" >삭제</a>
                        </div>
                    </c:if>
                </div>
            </c:forEach>
        </c:if>

        <div class="reply_div">
            <c:if test="${!empty member_id}">
                <div class="reply_wrap">
                    <h4>${member_id}</h4>
                    <input type="hidden" value="${member_id}" id="member_id">
                    <textarea class="reply" id="reply" name="back_end_list_cont" placeholder="댓글 : " onkeyup="text_area_length();" ></textarea>
                    <input type="button" value="작성" onclick="return reply_ok();">
                    <input type="hidden" value="${no}" id="ref_no">
                </div>
            </c:if>

            <c:if test="${empty member_id}">
                <div class="login_div">
                    <h3><a href="/login" style="color: blue">로그인 이후 사용 가능합니다</a></h3>
                </div>
            </c:if>
        </div>
    </div>
</div>

</div>
</body>
</html>
