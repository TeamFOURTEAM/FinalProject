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
</head>
<body>
	<div class="container">
        <!-- 상품 상세 영역 -->
        <div class="item_main">
            <div class="itemImg">
                <img src="/resources/photo_upload${s.item_img}" class="target" data-zoom="3" />
            </div>

            <div class="itemContBox">
                <div class="itemContName">
                    <span class="contName">${s.item_name}</span>
                </div>

                <div class="itemContInfo">
                    <span class="contInfo">${s.item_sub}</span>
                </div>

                <div class="itemContPrice">
                    <span class="contPrice">${s.item_price}</span>
                </div>
                
                <div class="itemContReco">
                    <span class="contReco">${s.item_likeCount}</span>
                </div>

                <form method="get" name="itemBuy">
                <div class="itemCount">
                    <select name="selectItemCount">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
                
                <div class="itemBuyBox">
                    <button onclick="">장바구니에 담기</button>
                    <button onclick="">구매하기</button>
                    <div class="adminEditDel">
	                    <button type="button" 
	                    onclick="location='shop_cont?state=edit&item_no=${s.item_no}';">
	                    	수정하기</button>
	                    <button type="button" 
	                    onclick="location='shop_cont?state=del&item_no=${s.item_no}';">
	                    	삭제하기</button>
                    </div>
                </div>
                </form>
            </div>
            
            <div class="item_Cont">
           		${s.item_cont}
            </div>
        </div>
        <!--//상품 상세 영역 -->
    </div>
</body>
</html>