<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<!-- style -->
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/cat_board/cat.css">

<!-- js -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="/resources/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
$(function(){
    //전역변수
    var obj = [];              
    //스마트에디터 프레임생성
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: obj,
        elPlaceHolder: "cat_cont",
        sSkinURI: "/resources/smartEditor/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
        }
    });
    //전송버튼
    $("#save").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["cat_cont"].exec("UPDATE_CONTENTS_FIELD", []);
        //폼 submit
        $("#frm").submit();
    })
})
</script>

<script>
	function write_check() {		
		
		if($.trim($("#cat_title").val())==""){
			alert("고양이 종류를 입력하세요");
			$("#cat_title").val("").focus();
			return false;
		}
		if($.trim($("#cat_file").val())==""){
			alert("파일을 첨부해 주세요");
			$("#cat_file").val("").focus();
			return false;
		}		
		alert("저장되었습니다.");		
	}		
</script>

<!-- 본문 내용 -->
<main>
<section id="contents">
	<div class="container">
		<section id="cont">
			<article class="column col1">
				<div class="main">
					<form method="post" action="/cat_write_ok" onsubmit="return write_check();"
					enctype="multipart/form-data">
					
					<table id="cat_write" >
						<tr>
							<th>고양이 종류</th>
							<td><input name="cat_title" id="cat_title" size="20" /> </td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="cat_cont" id="cat_cont" cols="110" rows="30"></textarea></td>
						</tr>
						<tr>
							<th>파일첨부</th>
    						<td><input type="file" name="cat_file" id="cat_file" /></td>
						</tr>
						<tr>
							<th></th>
							<td>
								<input type="submit" class="size" id="save" value="저장" />
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

