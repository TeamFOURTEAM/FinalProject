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
				<span>${bakset_id}</span> 님의 장바구니 목록 ${page}
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
                            <div class="column table_type"><a href="#">이미지</a></div>
                            <div class="column table_title"><a href="#">상품명</a></div>
                            <div class="column table_name">단가</div>
                            <div class="column table_reco">
	                            <select name="basket_count" id="basket_count"
			                    	onchange="buyPrice()">
			                        <option value="1">1</option>
			                        <option value="2">2</option>
			                        <option value="3">3</option>
			                        <option value="4">4</option>
			                        <option value="5">5</option>
			                    </select>
                            </div>
                            <div class="column table_view">금액</div>
                            <div class="column table_date"><button type="button">삭제</button></div>
                    </div>
                </div>
                <!--//게시판 테이블 부분-->
				
				
				<div class="basket_info">
					<div class="item_price">장바구니 금액 합계 : </div>
					<div class="deli_price">배송료 : </div>
					<div class="all_price">전체 주문 금액 :</div>
				</div>
				<div class="basket_buy">
					<button id="basketBuy_btn" action="">구매</button>
					<button type="button" id="basketList_btn" onclick="location.href='total_shop?page=${page}&find_field=item_name&find_name=';">상품목록</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
















