<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<!-- style -->
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/cat_board/cat.css">

<!-- jquery -->
<script src="/js/cat_board/cat.js"></script>

<!-- 본문 내용 -->
<main>
    <form method="get" action="total_cat">
        <section id="contents">
            <div class="container">
                    <article class="column col1">
                        <div class="main">

                            <div class="board_list">
                                <div class="cat_list">

                                    <c:if test="${!empty clist }">
                                        <c:forEach var="c" items="${clist }">
                                            <div class="item">
                                                <div class="img">
                                                    <a href="cat_cont?class=cat&cat_no=${c.cat_no}&state=cont&page=${page}">
                                                        <img src="/resources/photo_upload${c.cat_file }" width="316"
                                                            height="360" />
                                                    </a>
                                                </div>
                                                <div class="name">
                                                    <a href="cat_cont?class=cat&cat_no=${c.cat_no}&state=cont&page=${page}">${c.cat_title}</a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty clist }">
                                        	목록이 없습니다.
                                    </c:if>

                                </div>


                                <%--페이징(쪽나누기)--%>
                                <div id="cList_paging">
                                    <%--검색전 페이징 --%>
                                    <c:if test="${(empty find_field)&&(empty find_name)}">
                                        <c:if test="${page <=1}">
                                            &lt;&nbsp;
                                        </c:if>
                                        <c:if test="${page >1}">
                                            <a href="total_cat?class=cat&page=${page-1}">&lt;</a>&nbsp;
                                        </c:if>

                                        <%--쪽번호 출력부분 --%>
                                        <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
                                            <c:if test="${a == page}"><span style="color: blue;">${a}&nbsp;</span>
                                            </c:if>

                                            <c:if test="${a != page}">
                                                <a href="total_cat?class=cat&page=${a}">${a}</a>&nbsp;
                                            </c:if>
                                        </c:forEach>

                                        <c:if test="${page>=maxpage}">&gt;</c:if>
                                        <c:if test="${page<maxpage}">
                                            <a href="total_cat?class=cat&page=${page+1}">&gt;</a>
                                        </c:if>
                                    </c:if>

                                    <%--검색후 페이징 --%>
                                    <c:if test="${(!empty find_field) || (!empty find_name)}">
                                        <c:if test="${page <=1}">
                                            &lt;&nbsp;
                                        </c:if>
                                        <c:if test="${page >1}">
                                            <a
                                                href="total_cat?class=cat&page=${page-1}&find_field=${find_field}&find_name=${find_name}">
                                                &lt;</a>&nbsp;
                                        </c:if>

                                        <%--쪽번호 출력부분 --%>
                                        <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
                                            <c:if test="${a == page}">
                                                <span style="color: blue;">${a}&nbsp;</span>
                                            </c:if>

                                            <c:if test="${a != page}">
                                                <a
                                                    href="total_cat?class=cat&page=${a}&find_field=${find_field}&find_name=${find_name}">
                                                    ${a}</a>&nbsp;
                                            </c:if>
                                        </c:forEach>

                                        <c:if test="${page>=maxpage}">&gt;
                                        </c:if>
                                        <c:if test="${page<maxpage}">
                                            <a
                                                href="total_cat?class=cat&page=${page+1}&find_field=${find_field}&find_name=${find_name}">
                                                &gt;</a>
                                        </c:if>
                                    </c:if>
                                </div>


                                <%--검색폼 --%>
                                <div id="cFind_wrap">
                                    <select name="find_field" class="select">
                                        <option value="cat_title" <c:if test="${find_field == 'cat_title'}">
                                            ${'selected'}</c:if>>제목</option>
                                        <option value="cat_cont" <c:if test="${find_field == 'bbs_cont'}">
                                            ${'selected'}</c:if>>내용</option>
                                    </select>
                                    <input name="find_name" id="find_name" size="30" value="${find_name}" />
                                    <input type="submit" value="검색" />
                                    <input type="button" class="cWrite" value="글쓰기" onclick="location='cat_write?class=cat'" />
                                </div>

                                <!-- 글쓰기 버튼 -->
                                <div id="cWrite">
                                    
                                </div>

                            </div>
                        </div>
                    </article>
                </section>
            </div>
        <!-- contents -->
    </form>
</main>

<jsp:include page="../include/footer.jsp" />