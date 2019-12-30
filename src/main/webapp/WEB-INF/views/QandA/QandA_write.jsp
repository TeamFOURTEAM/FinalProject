<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<!-- style -->
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/QandA/QandA.css">

<!-- js -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/resources/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="/js/QandA/QandA.js"></script>


<script type="text/javascript">

	$(function(){
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "QandA_cont",
			sSkinURI: "/resources/smartEditor/SmartEditor2Skin.html",
			fCreator: "createSEditor2",
			htParams: {
				bUseToolbar : true, //툴바 사용 여부
				bUseVerticalResizer : true, //입력창 크기 조절바 사용 여부
				bUseModeChanger : true //모드 탭 사용 여부	
			}
		});
		
		$('#save').click(function () {
			oEditors.getById['QandA_cont'].exec('UPDATE_CONTENTS_FIELD',[]);
			var cont1= $("#QandA_cont").val();
			
			/** 스마트 에디터 입력부분 유효성 검증 **/
			if( cont1 == ""  || cont1 == null || cont1 == '&nbsp;' || cont1 == '<p>&nbsp;</p>')  {
	             alert("내용을을 입력해주세요.");
	             oEditors.getById["QandA_cont"].exec("FOCUS"); //포커싱
	             return;
	        }
			$('#frm').submit();
		});
	});
</script>

<!-- 본문 내용 -->
<main>
<section id="contents">
	<div class="container">
		<section id="cont">
			<article class="column col1">
				<div class="main">
					<form method="post" action="/QandA_write_ok" id="frm" onsubmit="return QandA_write_ok();">
					
					<table id="QandA_write" >
						<tr>
							<th>이름</th>
							<td><input name="QandA_name" id="QandA_name" size="14" /> </td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input name="QandA_title" id="QandA_title" size="20" /> </td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="QandA_pwd" id="QandA_pwd" size="24" /> </td>
						</tr>						
						<tr>
							<th>내용</th>
							<td><textarea name="QandA_cont" id="QandA_cont" cols="110" rows="30"></textarea></td>
						</tr>
						<tr>
							<th></th>
							<td>
								<input type="button" class="size" id="save" value="저장" />
								<input type="button" class="size" value="취소" onclick="history.back();" />
							</td>
						</tr>
					</table>
					
					</form>
				</div>
			</article>
		</section>
	</div>
</section>
<!-- contents --> 
</main>



<jsp:include page="../include/footer.jsp" />

