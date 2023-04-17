$('#findIdBtn').on('click',function(){
    $('#findId').modal();
    $('.findMemberId').show();
    $('.selectId').hide();
    $('.form-group>form>input').val('');
    $('.findIdInput').text('');
    $('.dataNull').text('');
    
})

$('.selectIdBtn').on('click',function(){
    const memberName = $('#findMemberName').val();
    const memberEmail = $('#findMemberEmail').val();
    if(memberName != '' && memberEmail != ''){
    $.ajax({
        url : "/findMemberId.do",
        type : "POST",
        data : {memberName : memberName,memberEmail : memberEmail},
        success : function(data){
            console.log(data)
            if(data == 'null'){
                $('.dataNull').text('아이디 또는 이메일을 확인하세요.');
                $('.dataNull').css('color','#f00');
            }else{
                $('.findIdInput').text(data);
                $('.findMemberId').hide();
                $('.selectId').show();
            }
        }

    })
    }else if(memberName == ''){
        $('#findMemberName').focus();
    }else if(memberEmail == ''){
        $('#findMemberEmail').focus();
    }
})

$('.idOkBtn').on('click',function(){
    $('.close').click();
})

$('#findPwBtn').on('click',function(){
    $('#findPw').modal();
})

