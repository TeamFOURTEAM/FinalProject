<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
        content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <meta name="author" content="이재형">
    <meta name="description" content="반려동물용품내용">
    <title>반려동물상품</title>

    <!-- Style -->
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/shop/shop_cont.css">
    <link rel="stylesheet" href="/css/main/font-awesome.css">
    
    <!-- JavaScript Libraries -->
    <script src="/js/shop/zoom.js"></script>
    <script src="/js/jquery.js"></script>
    <script src="/js/shop/shop.js"></script>
    
<script>
	 /* function item_Buy_Check(){
		var stockCount = ${s.item_stockCount};
		var select = document.getElementById("basket_count");
		var selectedCount = parseInt(select.options[select.selectedIndex].value);
		
	 	if(selectedCount > stockCount) {
			alert('재고가 부족합니다. 보다 적은 수량을 선택해주세요.');
			return false;
		}
	};  */
	
	/* 장바구니 테이블에 저장 */
 	$('#basket_button').on('click',function(){
 		
 	}); 
	
	/* 총가격 계산 후 span에 출력 */
	function buyPrice(){
		var select = document.getElementById("basket_count");
		var selectedCount = parseInt(select.options[select.selectedIndex].value);
		var price = ${s.item_price};
		var sum = price * selectedCount;
		
		$('.itemPriceSum').html('총 합계금액 : ￦ '+sum);
	};
</script>
</head>
<body>
	<div class="container">
        <!-- 상품 상세 영역 -->
        <div class="item_main">
            <div class="itemImg">
                <img src="/resources/photo_upload${s.item_img}" class="target" data-zoom="2" />
                <!-- data-zoom 으로 돋보기 크기 조절 -->
            </div>

            <div class="itemContBox">
                <div class="itemContName">
                    <span class="contName">${s.item_name}</span>
                </div>

                <div class="itemContInfo">
                    <span class="contInfo">${s.item_sub}</span>
                </div>

                <div class="itemContPrice">
                    <span class="contPrice">가격 : \ ${s.item_price}</span>
                </div>
                
                <div class="itemContReco">
                    <span class="contReco">이 상품이 좋아요! : ${s.item_likeCount}</span>
                </div>
                <form method="post" name="itemBuy">
                <input type="hidden" name="basket_id" value="pebble" /><%-- 임시 아이디(지울것) --%>
                <input type="hidden" name="product_no" value="${s.item_no}" />
                
                <div class="itemCount">
                	<span class="contCount" >수량 :  </span>
                    <select name="basket_count" id="basket_count"
                    	onchange="buyPrice()">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                    <c:if test="${s.item_stockCount == '0'}">
                    	<span class="stockZero">이 상품의 재고가 없습니다. 문의해주세요!</span>
                    </c:if>
                    <c:if test="${s.item_stockCount != '0'}">
                    	<div class="itemPriceSum"></div>
	                    <div class="itemBuy">
	                    
	                    	<%-- 하나의 form에서 action을 2개로 나눔. 장바구니쪽은 ajax 처리  --%>
		                    <button type="button" id="basket_button">장바구니에 담기</button>
		                    <button id="buy_button" 
		                    onclick="javascript: form.action='buy';">구매</button>
	                    </div>
	                    <div class="basketAsk">
	                    	<span>장바구니에 상품이 담겼습니다.</span>
	                    	<button id="basket_list_button" 
	                    	onclick="javascript: form.action='basket_list';">장바구니로 가기</button>
	                    </div>
                    </c:if>
               	</div>
               	</form>
                
                <div class="itemBuyAdminBox">
                    <div class="adminEditDel">
	                    <button type="button" 
	                    onclick="location='shop_cont?state=edit&item_no=${s.item_no}&page=${page}';">
	                    	수정하기</button>
	                    	
	                    <form method="get" action="/shop_del"
	                    	 onsubmit="return shop_del_check();" class="del_form">
						<%-- 히든 값 --%>
						<input type="hidden" name="item_no" value="${s.item_no}" /> 
						<input type="hidden" name="page" value="${page}" />
						<input type="hidden" name="item_img" value="${s.item_img}" />
						
						<button id="del_button">삭제</button>
	                    </form>
	                    <button type="button" 
	                    onclick="location='total_shop?page=${page}&find_field=item_name&find_name=';">임시 뒤로 버튼</button>
	                    <!-- 삭제해줘야함(임시버튼)-->
                    </div>
                </div>
                </div>
            </div>
        <!--//상품 상세 영역 -->
        
        <!-- 상품 상세 설명 영역 -->
            <div class="item_Cont">
           		${s.item_cont}
            </div>
        </div>
        <!--//상품 상세 설명 영역 -->        
</body>
</html>