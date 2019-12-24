<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

<!-- style -->
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/cat_board/cat.css">

<!-- jquery -->
<script src="/js/cat_board/cat.js"></script>

<!-- 본문 내용 -->
<main>
<section id="contents">
	<div class="container">
		<section id="cont">
			<article class="column col1">
				<div class="main">
					${cat_cont }
				</div>
				
				<div id="cat_menu">
					<input type="button" value="수정" 
					onclick="location='cat_cont?cat_no=${c.cat_no}&page=${page }&state=edit';" />
					
					<input type="button" value="목록" 
					onclick="location='/cat/total_cat?page=${page}';" />
					
					<form method="post" action="/cat_del_ok" onsubmit="return del_check();">
						<input type="hidden" name="cat_no" value="${c.cat_no}" />
   						<input type="hidden" name="page" value="${page}" />
						<input type="submit" value="삭제" id="del"
						onclick="location='cat_cont?cat_no=${c.cat_no}&page=${page}&state=del';"/>
					</form>	
				</div>
				
				
				
			</article>
		</section>
	</div>
</section>
<!-- contents --> 
</main>

<jsp:include page="../include/footer.jsp" />

