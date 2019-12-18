<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>

<!-- style -->
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/cat_board/cat_write.css">

<!-- js -->
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="/resources/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	
<script>
$(function (){
    // .attr()은 속성값(property)을 설정할 수 있다.
      $('#header').attr('style', 'background: url(/resources/img/cat/cat01.jpg);');
  });
</script>

<script>
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

<!-- 본문 내용 -->
<main>
<section id="contents">
	<div class="container">
		<section id="cont">
			<article class="column col1">
				<div class="main">
					<form method="post" action="/cat_edit_ok" enctype="multipart/form-data">
					
					<%-- 히든값 --%>
					<input type="hidden" name="cat_no" value="${c.cat_no }" />
					<input type="hidden" name="page" value="${page }" />
					
					<table id="cat_write" width="100%">
						<tr>
							<th>고양이 종류</th>
							<td><input name="cat_title" id="cat_title" size="20" value="${c.cat_title }" /> </td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea name="cat_cont" id="cat_cont" cols="100" rows="20">
								${c.cat_cont }</textarea>
							</td>
						</tr>
						<tr>
							<th>파일첨부</th>
    						<td><input type="file" name="cat_file" />
    						<br/>${c.cat_file }
    						</td>
						</tr>
					</table>
					
					<div id="cat_menu">
						<input type="submit" id="save" value="수정" />
						<input type="button" value="취소" onclick="history.back();" />
					</div>
					
					</form>
				</div>
			</article>
		</section>
	</div>
</section>
<!-- contents --> 
</main>


<jsp:include page="../include/footer.jsp" />

