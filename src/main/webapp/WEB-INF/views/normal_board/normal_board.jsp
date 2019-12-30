<%--
  Created by IntelliJ IDEA.
  User: BlackJack21
  Date: 2019-12-30
  Time: 오후 1:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/normal_board/normal_board.css">
    <title>Q&A 게시판</title>
</head>
<body>
<div class="page-body">
    <div class="bbs-tit">
        <span class="braket">[</span>
        <strong>일반게시판</strong>
        <span class="braket">]</span>
    </div>
    <dl class="bbs-link bbs-link-top">
        <dt class=""></dt>
        <dd>
            <a class="write" href="normal_list_cont">글쓰기</a>
        </dd>
    </dl>
    <div class="bbs-sch">
        <form action="board.html" name="form1">
            <input type="hidden" name="s_id" value="">
            <input type="hidden" name="code" value="astonwood_board1">
            <input type="hidden" name="page" value="1">
            <input type="hidden" name="type" value="s">
            <input type="hidden" name="board_cate" value="">
            <input type="hidden" name="review_type" value=""><!-- .검색 폼시작 -->
            <fieldset>
                <legend>게시판 검색 폼</legend>
                <label>
                    <input type="radio" name="shname" value="ok" onclick="change(1);" class="MS_input_checkbox">                                    이름
                </label>
                <label>
                    <input type="radio" name="ssubject" value="ok" onclick="change(2);" checked="checked" class="MS_input_checkbox">                                    제목
                </label>
                <label>
                    <input type="radio" name="scontent" value="ok" onclick="change(3);" class="MS_input_checkbox">                                    내용
                </label>
                <span class="key-wrap">
                                    <input type="text" name="stext" value="" class="MS_input_txt"><a href="javascript:document.form1.submit();"><img src="http://www.astonwood.co.kr/images/d3/modern_simple/btn/btn_bbs_sch.gif" alt="검색" title="검색"></a>
                                </span>
            </fieldset>
        </form><!-- .검색 폼 끝 -->
    </div><!-- .bbs-sch -->
    <div class="bbs-table-list">
        <table summary="No, content,Name,Data,Hits">
            <caption>일반게시판 게시글</caption>
            <colgroup>
                <col width="50">
                <col width="30">
                <col width="*">
                <col width="110">
                <col width="90">
                <col width="60">
            </colgroup>
            <thead>
            <tr>
                <th scope="col"><div class="tb-center">No.</div></th>
                <th scope="col"><div class="tb-center">&nbsp;</div></th>
                <th scope="col"><div class="tb-center">Content</div></th>
                <th scope="col"><div class="tb-center">Name</div></th>
                <th scope="col"><div class="tb-center">Date</div></th>
                <th scope="col"><div class="tb-center">Hits</div></th>
            </tr>
            </thead>
            <tbody>
            <!--. 공지사항 리스트 끝! -->

            <!--. 게시글 리스트 시작(한페이지당 게시글 수) -->
            <tr>
                <td><div class="tb-center">1</div></td>
                <td><div class="tb-left"></div></td>
                <!-- .product image 관련 -->
                <td>
                    <div class="tb-left">

                        <!--. 스팸글 처리 -->
                        <a href="#">테스트</a>
                    </div>
                </td>
                <td>
                    <div class="tb-center">
                        테스트
                    </div>
                </td>
                <td><div class="tb-center">2017/12/20</div></td>
                <td><div class="tb-center">106</div></td>
            </tr>
            <!--. 게시글 리스트 끝 -->
            </tbody>
        </table>
    </div>
    <dl class="bbs-link bbs-link-btm">
        <dd>
            <a class="write" href="normal_list_cont">글쓰기</a>
        </dd>
    </dl>
    <div class="paging">
        <ol class="paging">
            <li><strong>1</strong></li>
        </ol>
    </div>
</div>
</body>
</html>
<%@include file="../include/footer.jsp"%>