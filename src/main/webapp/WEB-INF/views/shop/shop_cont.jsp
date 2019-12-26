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
                    <span class="contPrice">가격 : ${s.item_price}</span>
                </div>
                
                <div class="itemContReco">
                    <span class="contReco">이 상품이 좋아요! : ${s.item_likeCount}</span>
                </div>

                <form method="post" name="itemBuy">
                <div class="itemCount">
                	<span class="contCount" >수량 :  </span>
                    <select name="selectItemCount">
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
	                    <div class="itemBuy">
		                    <button onclick="">장바구니에 담기</button>
		                    <button onclick="">구매하기</button>
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