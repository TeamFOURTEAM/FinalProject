/**
 *  shop.js
 */

/** shop 관리자 글쓰기 유효성 검증 **/

function shop_check(){
	if($.trim($("#item_name").val())==""){
		alert("상품명을 입력해주세요.");
		$("#item_name").val("").focus();
		return false;
	}
	if($.trim($("#item_sub").val())==""){
		alert("상품세부설명을 입력해주세요.");
		$("#item_sub").val("").focus();
		return false;
	}
	if($.trim($("#item_price").val())==""){
		alert("상품가격을 입력해주세요.");
		$("#item_price").val("").focus();
		return false;
	}
	if($.trim($("#item_stockCount").val())==""){
		alert("상품재고를 입력해주세요.");
		$("#item_stockCount").val("").focus();
		return false;
	}
	if($.trim($("#item_img").val())==""){
		alert("상품이미지를 추가해주세요.");
		$("#item_img").val("").focus();
		return false;
	}
	alert('상품이 등록되었습니다.');
}

function shop_edit_check(){
	if($.trim($("#item_name").val())==""){
		alert("상품명을 입력해주세요.");
		$("#item_name").val("").focus();
		return false;
	}
	if($.trim($("#item_sub").val())==""){
		alert("상품세부설명을 입력해주세요.");
		$("#item_sub").val("").focus();
		return false;
	}
	if($.trim($("#item_price").val())==""){
		alert("상품가격을 입력해주세요.");
		$("#item_price").val("").focus();
		return false;
	}
	if($.trim($("#item_stockCount").val())==""){
		alert("상품재고를 입력해주세요.");
		$("#item_stockCount").val("").focus();
		return false;
	}
	if($.trim($("#item_img").val())==""){
		alert("상품이미지를 추가해주세요.");
		$("#item_img").val("").focus();
		return false;
	}
	alert('상품이 수정되었습니다.');
}

	

/** shop 관리자 글쓰기 상품 가격 부분 숫자만 나오게 처리 **/
function onlyNumber(event){
  event = event || window.event;
  var keyID = (event.which) ? event.which : event.keyCode;
  if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
    return;
  else
    return false;
}
function removeChar(event) {
  event = event || window.event;
  var keyID = (event.which) ? event.which : event.keyCode;
  if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
    return;
  else
    event.target.value = event.target.value.replace(/[^0-9]/g, "");
}























