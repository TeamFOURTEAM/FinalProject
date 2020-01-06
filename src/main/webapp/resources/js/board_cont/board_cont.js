//분양게시판 헤더 이미지 변경
$(function (){
    // .attr()은 속성값(property)을 설정할 수 있다.
      $('#header').attr('style', 'background: url(/resources/img/cat/cat01.jpg);');
  });

function reply_ok() {
    var id=$('#member_id').val();
    var cont=$('#reply').val();
    var no=$('#ref_no').val();

    console.log(id);
    console.log(cont);
    console.log(no);


     $.ajax({
        type:"POST",
        url:"reply_ok",
        data: {"id":id,"cont":cont,"no":no},
        datatype:"int",
        success: function (data) {
            if(data!=1){
                alert('댓글 저장 실패!')
                return false;
            }else{
                // $('#reply_list_div').load(window.location.href+"#reply_list_div");
                location.reload();
            }
        },
        error:function(){
            alert("data error");
            // location='find_id'
        }
    });//$.ajax
}