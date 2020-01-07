<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<!-- style -->
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/cat_board/cat.css">
<link rel="stylesheet" href="/css/main/font-awesome.css">

<!-- jquery -->
<script src="/js/cat_board/cat.js"></script>

<!-- 좋아요(추천기능) -->
<script>
$(function(){
	// 추천버튼 클릭시(추천 추가 또는 추천 제거)
	$("#rec_update").click(function(){
		$.ajax({
			url: "/expro/RecUpdate.do",
            type: "POST",
            data: {
                no: ${content.board_no},
                id: '${user_id}'
            },
            success: function () {
		        recCount();
            },
		})
	})
	
	// 게시글 추천수
    function recCount() {
		$.ajax({
			url: "/expro/RecCount.do",
            type: "POST",
            data: {
                no: ${content.board_no}
            },
            success: function (count) {
            	$(".rec_count").html(count);
            },
		})
    };
    recCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
</script>

<!-- 본문 내용 -->
<main>
    <form method="get" action="total_cat">
        <section id="contents">
                    <article class="column col1">
                        <div class="main">

                            <div class="board_list">
                            <ul class="tabs">
                            	<li class="current"><a href="/cat/total_cat?page=1">전체</a></li>
                            	<li><a href="/cat/cat_mun_list?page=1">먼치킨</a></li>
                            	<li><a href="/cat/cat_shiam_list?page=1">샴</a></li>
                            	<li><a href="/cat/cat_fold_list?page=1">폴드</a></li>
                            	<li><a href="/cat/cat_persian_list?page=1">페르시안</a></li>
                            </ul>
                            
                                <div class="cat_list">
                                    <c:if test="${!empty clist }">
                                        <c:forEach var="c" items="${clist }">
                                            <div class="item">
                                                <div class="img">
                                                    <a href="cat_cont?cat_no=${c.cat_no}&state=cont&page=${page}">
                                                        <img src="/resources/photo_upload${c.cat_file }" width="316"
                                                            height="360" />
                                                    </a>
                                                </div>
                                                <div class="name">
                                                    <a href="cat_cont?cat_no=${c.cat_no}&state=cont&page=${page}">${c.cat_title}</a>
                                                    <!-- 좋아요(추천 기능) -->
                                                    <div>
			<div class="w3-border w3-center w3-padding">
				<c:if test="${user_id == null }">
					추천 기능은 <button type="button" id="newLogin"><b class="w3-text-blue">로그인</b></button> 후 사용 가능합니다.<br />
					<i class="fa fa-heart" style="font-size:16px;color:red"></i>
					<span class="rec_count"></span>					
				</c:if>
				<c:if test="${user_id != null }">
					<button class="w3-button w3-black w3-round" id="rec_update">
						<i class="fa fa-heart" style="font-size:16px;color:red"></i>
						<span class="rec_count"></span>
					</button> 
				</c:if>
			</div>
		</div>

						

                                                    
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty clist }">
                                        	<p>목록이 없습니다. 관리자에게 문의해 주세요.<p>
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
                                            <a href="total_cat?page=${page-1}">&lt;</a>&nbsp;
                                        </c:if>

                                        <%--쪽번호 출력부분 --%>
                                        <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
                                            <c:if test="${a == page}"><span style="color: blue;">${a}&nbsp;</span>
                                            </c:if>

                                            <c:if test="${a != page}">
                                                <a href="total_cat?page=${a}">${a}</a>&nbsp;
                                            </c:if>
                                        </c:forEach>

                                        <c:if test="${page>=maxpage}">&gt;</c:if>
                                        <c:if test="${page<maxpage}">
                                            <a href="total_cat?page=${page+1}">&gt;</a>
                                        </c:if>
                                    </c:if>

                                    <%--검색후 페이징 --%>
                                    <c:if test="${(!empty find_field) || (!empty find_name)}">
                                        <c:if test="${page <=1}">
                                            &lt;&nbsp;
                                        </c:if>
                                        <c:if test="${page >1}">
                                            <a
                                                href="total_cat?page=${page-1}&find_field=${find_field}&find_name=${find_name}">
                                                &lt;</a>&nbsp;
                                        </c:if>

                                        <%--쪽번호 출력부분 --%>
                                        <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
                                            <c:if test="${a == page}">
                                                <span style="color: blue;">${a}&nbsp;</span>
                                            </c:if>

                                            <c:if test="${a != page}">
                                                <a
                                                    href="total_cat?page=${a}&find_field=${find_field}&find_name=${find_name}">
                                                    ${a}</a>&nbsp;
                                            </c:if>
                                        </c:forEach>

                                        <c:if test="${page>=maxpage}">&gt;
                                        </c:if>
                                        <c:if test="${page<maxpage}">
                                            <a
                                                href="total_cat?page=${page+1}&find_field=${find_field}&find_name=${find_name}">
                                                &gt;</a>
                                        </c:if>
                                    </c:if>
                                </div>


                                <%--검색폼 --%>
                                <div id="cFind_wrap">
                                    <select name="find_field" class="select">
                                        <option value="cat_title" <c:if test="${find_field == 'cat_title'}">
                                            ${'selected'}</c:if>>제목</option>
                                        <option value="cat_cont" <c:if test="${find_field == 'cat_cont'}">
                                            ${'selected'}</c:if>>내용</option>
                                    </select>
                                    <input name="find_name" id="find_name" id="find_name" autocomplete="off" size="30" value="${find_name}" />
                                    <input type="submit" value="검색" />
                                    
                                    <c:set var="b" value="${user_id}"/>
                                    <c:if test="${b=='admin'}">                                    
                                    <input type="button" class="cWrite" value="글쓰기" onclick="location='cat_write?class=cat'" />
                                	</c:if>
                                </div>

                            </div>
                        </div>
                    </article>
                </section>
        <!-- contents -->
    </form>
</main>

<jsp:include page="../include/footer.jsp" />