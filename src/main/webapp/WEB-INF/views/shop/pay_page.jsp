<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
	<!-- Style -->
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/shop/pay_page.css">
    
    <!-- JavaScript Libraries -->
    <script src="/js/jquery.js"></script>
</head>
<body>
	<div class="container">
		<div class="basket_title">
			<span>주문 과정</span>
		</div>
		
         	<form method="post" action="pay_page_ok">
		<div class="basket_list">
			<!-- 주문 과정 목록 테이블 부분-->
               <div class="basket_table">
               	<p class="basket_head">
               		<span style="width: 30%;">상품명</span>
               		<span style="width: 15%;">단가</span>
               		<span style="width: 5%;">수량</span>
               		<span style="width: 15%;">금액</span>
               	</p>
               	<%-- 주문 과정 목록 테이블 시작 --%>
               
                   <c:forEach var="cart" items="${map.list}">
				<div class="basket_body">
                    	<div class="column table_title">
                   			${cart.product_name}
                    	</div>
                    	<div class="column table_name">
                    		\ <fmt:formatNumber pattern="###,###,###" value="${cart.price}" />
                    	</div>
                    	<div class="column table_reco">
                    		${cart.basket_count}
	                    </div>
	                    <div class="column table_view">
	                    	\ <fmt:formatNumber pattern="###,###,###" value="${cart.sumPrice}" />
                    	</div>
                    </div>
                    </c:forEach>
               <%--//주문 과정 목록 테이블 시작 --%>
                </div>
               <!--//주문 과정 목록 목록 테이블 부분-->
              	</div><%-- basket list --%>
              	
              	<div class="user_info">
              		<div class="info_title">
              			<span>주문 정보</span>
              		</div>
              		<div class="info_center">
              			<div class="CusName">받으시는 분 : </div>
              			<div class="CusPhone">휴대전화번호 : </div>
              		</div>
              	</div>
              	
			<div class="basket_info">
				<div class="item_price">
					주문 금액 합계 : \ <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}" />
				</div>
				<div class="deli_price">
					배송료 :  \ <fmt:formatNumber pattern="###,###,###" value="${map.fee}" />
				</div>
				<div class="info_line"></div>
				<div class="all_price">
					결제 예상 금액 :  \ <fmt:formatNumber pattern="###,###,###" value="${map.allSum}" />
				</div>
			</div>
			<div class="basket_buy">
				<input type="hidden" name="pay_price" value="${map.allSum}" />
				<input type="hidden" name="page" value="${map.page}" />
				<button id="basketBuy_btn">결제</button>
				<button type="button" id="basketList_btn" onclick="history.back();">장바구니로 돌아가기</button>
			</div>
		</form>
    </div>
    
    <script>
    	$('#basketBuy_btn').on('click', function(){
    		var ask = confirm('결제 하시겠습니까?');
    		
    		if(ask) {
    			
    		}else {
    			return false;
    		}
    		
    	});
    </script>
</body>
</html>













