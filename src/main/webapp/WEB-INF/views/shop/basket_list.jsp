<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록</title>

	<!-- Style -->
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/shop/basket_list.css">
    
    <!-- JavaScript Libraries -->
    <script src="/js/jquery.js"></script>
    
</head>
<body>
	<div class="container">
		<form method="post">
			<div class="basket_title">
				<span>${bakset_id}</span> 님의 장바구니 목록
			</div>
			
			<div class="basket_list">
				<!-- 게시판 테이블 부분-->
                <div class="basket_table">
                    <p class="basket_head">
                        <span style="width: 7%;">No.</span> 
                        <span style="width: 10%;">상품 이미지</span> 
                        <span style="width: 30%;">상품명</span>
                        <span style="width: 15%;">단가</span> 
                        <span style="width: 5%;">수량</span> 
                        <span style="width: 15%;">금액</span>
                        <span style="width: 5%;"></span>
                    </p>

                    <div class="basket_body">
                            <div class="column table_no">1</div>
                            <div class="column table_type">자유</div>
                            <div class="column table_title"><a href="#">게시판 리스트 예시</a></div>
                            <div class="column table_name">이재형</div>
                            <div class="column table_reco">1</div>
                            <div class="column table_view">1</div>
                            <div class="column table_date">2019.11.28</div>
                    </div>
                </div>
                <!--//게시판 테이블 부분-->
				
				
				<div class="basket_info">
					장바구니 합계, 배송료, 금액 영역
				</div>
				<div class="basket_buy">
					<button id="basketBuy_btn" action="">구매</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
















