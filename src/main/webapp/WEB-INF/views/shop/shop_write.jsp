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

</head>
<body>

<div class="write_main">
	<div class="write_text">
		<span>Shop 컨텐츠 수정</span>
		
		<form method="post" action="write_insert" id="frm">
			<table>
				<tr>
					<th>상품명</th>
					<td><input type="text" /></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" /></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="write_cont" id="write_cont" cols="100" rows="20"></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="text" readonly/></td>
				</tr>
				<tr>
					<th></th>
					<td colspan="2">
						<input type="submit" id="save" value="save" class="btn"/>
						<input type="reset" value="cancel" class="btn"
						onclick="history.back();" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>



<!-- java script -->
<script type="text/javascript">

	$(function(){
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "write_cont",
			sSkinURI: "/resources/smartEditor/SmartEditor2Skin.html",
			fCreator: "createSEditor2",
			htParams: {
				bUseToolbar : true, //툴바 사용 여부
				bUseVerticalResizer : true, //입력창 크기 조절바 사용 여부
				bUseModeChanger : false //모드 탭 사용 여부	
			}
		});
		
		$('#save').click(function () {
			oEditors.getById['write_cont'].exec('UPDATE_CONTENTS_FIELD',[]);
			$('#frm').submit();
		});
	});
</script>

</body>
</html>





























