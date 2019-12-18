<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop 관리자 글쓰기</title>


<!-- style -->
<link rel="stylesheet" href="/css/shop/shop_write.css" />
<link rel="stylesheet" href="/css/reset.css" />

<!-- js -->
<script src="/js/jquery.js"></script>
<script src="/resources/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="/js/shop/shop.js"></script>

<!-- java script -->
<script type="text/javascript">

	$(function(){
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "item_cont",
			sSkinURI: "/resources/smartEditor/SmartEditor2Skin.html",
			fCreator: "createSEditor2",
			htParams: {
				bUseToolbar : true, //툴바 사용 여부
				bUseVerticalResizer : true, //입력창 크기 조절바 사용 여부
				bUseModeChanger : true //모드 탭 사용 여부	
			}
		});
		
		$('#save').click(function () {
			oEditors.getById['item_cont'].exec('UPDATE_CONTENTS_FIELD',[]);
			$('#frm').submit();
		});
	});
</script>

</head>
<body>

<div class="write_main">
	<div class="write_text">
		<span>관리자 Shop 컨텐츠 수정</span>
		
		<form method="post" action="/shop_write_ok" id="frm" 
		onsubmit="return shop_check();" enctype="multipart/form-data">
			<table>
				<tr>
					<th>상품명</th>
					<td><input name="item_name" id="item_name" /></td>
				</tr>
				<tr>
					<th>세부설명</th>
					<td><input name="item_sub" id="item_sub" /></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input name="item_price" id="item_price"  /></td>
				</tr>
				<tr>
					<th>상품 재고</th>
					<td><input name="item_stockCount" id="item_stockCount"  /></td>
				</tr>
				<tr>
					<th>상품 설명</th>
					<td>
						<textarea name="item_cont" id="item_cont" cols="100" rows="20"></textarea>
					</td>
				</tr>
				<tr>
					<th>상품 이미지</th>
					<td>
						<input type="file" name="item_img" id="item_img" readonly />
					</td>
				</tr>
				<tr>
					<th></th>
					<td colspan="2">
						<input type="button" id="save" class="btn" value="저장" />
						<!-- submit 두번돌지 않게 유의 -->
						<input type="reset" value="취소" class="btn"
						onclick="history.back();" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>

</body>
</html>





























