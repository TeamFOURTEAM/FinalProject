<%-- <%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../include/header.jsp" %>


본문내용
<div id="wel_cont">
 <div id="bsDel_wrap">
  <h2 class="bsDel_title">자료실 삭제</h2>
  <form method="post" action="/cat_del_ok">
   <input type="hidden" name="cat_no" value="${c.cat_no}" />
   <input type="hidden" name="page" value="${page}" />

   <div id="bsDel_menu">
    <input type="submit" value="삭제" />
    <input type="reset" value="취소"
    onclick="$('#bbs_pwd').focus();" />   
    
   </div> 
  </form>
 </div> 
</div>

<jsp:include page="../include/footer.jsp" />


















































 --%>