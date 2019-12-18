/**
 *  shop.js
 */

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
	/*if($.trim($("#item_cont").val())==""){
		alert("상품설명을 입력해주세요.");
		$("#item_cont").val("").focus();
		return false;
	}*/
}
























