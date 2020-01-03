//일반게시판 분양 헤더 이미지 변경
$(function (){
    // .attr()은 속성값(property)을 설정할 수 있다.
      $('#header').attr('style', 'background: url(/resources/img/cat/cat01.jpg);');
  });

function reply_ok() {
    var id=$('#normal_id').val();
    var cont=$('#normal_cont').val();
    var no=$('#normal_no').val();

    console.log(id);
    console.log(cont);
    console.log(no);


     $.ajax({
        type:"POST",
        url:"normal_board_list_cont_reply_ok",
        data: {"id":id,"cont":cont,"no":no},
        datatype:"int",
        success: function (data) {
            if(data!=1){
                alert('댓글 저장 실패!')
                return false;
            }else{
                alert('저장 성공!');
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