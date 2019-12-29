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
                <input type="hidden" name="page" value="${page}" />
                
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
	                    	<button type="button" id="basketCancel"><i class="fa fa-window-close-o" aria-hidden="true"></i></button>
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
<script>

/* 장바구니 테이블에 저장(ajax) */
$('#basket_button').on('click',function(){
	var basket_id = 'pebble'; //임시 아이디(이후에 세션값을 가져오게끔 한다)
	var product_no = ${s.item_no}; //상품번호
	var select = document.getElementById("basket_count");//select값
	var selectedCount = parseInt(select.options[select.selectedIndex].value);
	//select 값 숫자로 변환. 선택한 상품수량
	var stockCount = ${s.item_stockCount};//재고수량
	
	//로그인 여부 확인
	if(basket_id == '') {
		alert('로그인 되어있지 않습니다. 로그인 해주세요.');
		return false;
	}
	
	//재고수량 확인(재고보다 적으면 출력)
	if(selectedCount > stockCount) {
		alert('재고가 부족합니다. 보다 적은 수량을 선택해주세요.');
		return false;
	}

	$.ajax({//jQuery ajax
		type : 'post',
		url : '/shop/basket_add',//매핑주소
		headers : {
			"Content-type" : "application/json",
			"X-HTTP-Method-Override" : "POST" //HTTP코드 맨머리 앞에 
			//추가적인 정보지정
		},
		dataType : 'text',//문자열
		data : JSON.stringify({//내용이 json
			basket_id : basket_id,//아이디
			product_no : product_no,//상품 번호
			basket_count : selectedCount//선택수량
		}),
		success : function(data){//장바구니저장 성공시 
			//SUCCESS 문자열 반환
			if(data == 'SUCCESS') {
				//alert('장바구니에 상품이 담겼습니다.');//지울 메시지(div로 대체)
				$('.basketAsk').show();
				setTimeout(function(){// 초 동안만 알림창을 유지
					$('.basketAsk').hide();
				},5000);
			}//if
		}//function(data)
	});
});

/* 장바구니 알림창 닫기 */
$('#basketCancel').on('click',function(){
	$('.basketAsk').hide();
});

</script>
</body>
</html>