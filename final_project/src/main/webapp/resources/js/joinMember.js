
$('#memberPwRe').on('change',function(){
    if($('#memberPw').val() ==''){
        $('#pwChkSpan').text('영어 대/소문자 숫자 특수문자(!,@,#,$,%)를 포함하여 8~15글자를 입력해주세요.');
        $('#memberPw').focus();
    }else{
            const pwValue = $('#memberPwRe').val();
            let count = 0;
            const regArr = [
            /^.{8,15}$/,
            /[A-Z]/,
            /[a-z]/,
            /[0-9]/,
            /[!@#$%]/
            ];
            for(let i=0 ; i<regArr.length;i++){
                const check = regArr[i].test(pwValue);
                if(check){
                    count++;
                }
            }
            if(count == regArr.length){
                if($('#memberPw').val() == pwValue){
                    $('#pwChkSpan').text('일치합니다.');
                }else{
                    $('#pwChkSpan').text('영어 대/소문자 숫자 특수문자(!,@,#,$,%)를 포함하여 8~15글자를 입력해주세요.');
                }
            }else{
                $('#pwChkSpan').text('영어 대/소문자 숫자 특수문자(!,@,#,$,%)를 포함하여 8~15글자를 입력해주세요.');
            }
    }
    
});


$('#memberPw').on('change',function(){
    const pwValue = $('#memberPw').val();
    const regChk = [/^.{8,15}$/];
    const check = regChk[0].test(pwValue);
    if(check){
        $('#pwChkSpan').text('');
    }else{
        $('#pwChkSpan').text('영어 대/소문자 숫자 특수문자(!,@,#,$,%)를 포함하여 8~15글자를 입력해주세요.');
        $('#memberPw').focus();

    }
});


$('.memberGender').on('click',function(){
    $('.memberGender').removeClass('genderClick');
    $(this).toggleClass('genderClick');
});

$('.emailSelect').on('change',function(){
    $('#email2').val($(this).val());
});

$('[name=emailChk]').on('click',function(){
    const email1 = $('#email1').val();
    const email2 = $('#email2').val();
    const email = email1+"@"+email2;
    if(email1 == ''){
        $('.email1').focus();
    }else if(email2 ==''){
        $('.email2').focus();
    }else if(email1 !=''&& email2 !=''){
        $.ajax({
            url : "/joinSendMail.do",
            type : "post",
            data : {email:email},
            success : function(data){
                if(data == "null"){
                    alert("이메일 주소를 확인해주세요.");
                }else{
                    const mailCode = data;
                    $("#myModal").modal();
                    $('[name=emailCode]').val(mailCode);
                }
            }
        });
    }
});

$("[name=emailCodeChk]").click(function(){
    const emailCode = $('[name=emailCode]').val();
    if(emailCode == $('#emailCode').val()){
        $('.close').click();
        $('#email1').attr('readonly',"true");
        $('#email2').attr('readonly',"true");
        const memberEmail = $('[name=memberEmail]');
        const email1 = $('#email1').val();
        const email2 = $('#email2').val();
        const email = email1+"@"+email2;
        memberEmail.val(email);
        $('.emailChk').val('1');
    }else{
        alert('인증번호를 다시 확인하세요.');
    }
});

    function notsubmit(){
        const input = $('input');
        for(let i=0 ;i<input.length;i++){
            const inputVal = input.eq(i).val();
            if(inputVal == ''){
                input.eq(i).focus();
                break;
            }
        }
    if($('.emailChk').val() == 0){
    return false;
    }else{
        return true;
    }
}

    $('[name=idChk]').on('click',function(){
        const memberId = $('#memberId').val();
        if(memberId != ''){
        $.ajax({
            url : "/idChk.do",
            type : "POST",
            data : {memberId : memberId},
            success : function(data){
                if(data == 'null'){
                    $('#notUseIdInput').val(memberId);
                    $('.notUseId').show();
                    $('.useId').hide();
                    $('#idchk').hide();
                    $('input[name=memberId]').val(memberId);
                }else{
                    $('.notUseId').hide();
                    $('.useId').show();
                    $('#userIdInput').focus();
                }
            }
        });
        $("#idChkModal").modal();
    }else{
        $('#memberId').focus();
    }
    })


    $('.successId').on('click',function(){
        $('.close').click();
        $('input[name=memberId]').attr('readonly','true');
        $('input[name=memberPw]').focus();
    })

    $('.idChkBtn').on('click',function(){
        const memberId = $('#userIdInput').val();
        if(memberId != ''){
        $.ajax({
            url : "/idChk.do",
            type : "POST",
            data : {memberId : memberId},
            success : function(data){
                if(data == 'null'){
                    $('#notUseIdInput').val(memberId);
                    $('.notUseId').show();
                    $('.useId').hide();
                    $('#idchk').hide();
                    $('input[name=memberId]').val(memberId);
                }else{
                    $('.notUseId').hide();
                    $('.useId').show();
                    $('#userIdInput').focus();
                }
            }
        })
        }else{
            $('#userIdInput').focus();
        }
    })