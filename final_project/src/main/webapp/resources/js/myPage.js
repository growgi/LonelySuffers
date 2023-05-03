$('.tab-content>li').on('click',function(){
    const index = $('.tab-content>li').index(this);
    $('.tab-content>li').removeClass('li-active');
    $('.tab-content>li').eq(index).addClass('li-active');
    $('.right-content>div').removeClass('active-div');
    $('.right-content>div').eq(index).addClass('active-div');
    if(index == 2){
        $('.messageArea').scrollTop($('.messageArea')[0].scrollHeight);
    }
    $('.tabNo').val(index);
})

$('.myProfile>div>ul>li').on('click',function(){
    const index = $('.myProfile>div>ul>li').index(this);
    if(index == 0 || index == 2 || index == 4 || index == 6){
        $('.myProfile>div>ul>li').eq(1).addClass('hidden-li');
        $('.myProfile>div>ul>li').eq(3).addClass('hidden-li');
        $('.myProfile>div>ul>li').eq(5).addClass('hidden-li');
        $('.myProfile>div>ul>li').eq(7).addClass('hidden-li');
        $('.myProfile>div>ul>li').eq(index+1).toggleClass('hidden-li');
    }
})

// $('.tab-content>li').eq(0).click();
// $('.myProfile>ul>li').eq(0).click();


//이전 비밀번호 입력시 새 비밀번호 변경창 띄우는 ajax
$('.beforePassWordBtn').on('click',function(){
    if($('#beforePassWord').val() != ''){
        const memberPw = $('#beforePassWord').val();
        const memberId = $('#memberId').val();
        $.ajax({
            url : "beforePassWord.do",
            type : "post",
            data : {memberId : memberId,memberPw : memberPw},
            success : function(data){
                if(data == "ok"){
                    $('.beforePassWordFrm').hide();
                    $('.updatePassWordFrm').show();
                }else{
                    alert("비밀번호를 다시 확인해주세요.");
                }
            }
        });
    }
});

$('.passWordChangeBtn').on('click',function(){
    const afterPw = $('#afterPassWord').val();
    const afterPwRe = $('#afterPassWordRe').val();
    if(afterPw == afterPwRe){
    let count = 0;
    const regArr = [
            /^.{8,15}$/,
            /[A-Z]/,
            /[a-z]/,
            /[0-9]/,
            /[!@#$%]/
    ];
    for(let i=0 ; i<regArr.length;i++){
    const check = regArr[i].test(afterPwRe);
        if(check){
            count++;
        }
    }
    if(count == regArr.length){
        const memberId = $('#memberId').val();
        $.ajax({
            url : "/updatePassWord.do",
            type : "POST",
            data : {memberId:memberId,memberPw:afterPwRe},
            success : function(data){
                if(data == 'ok'){
                    location.href= "/myPage.do?reqPage=1&tabNo=0";
                }
            }
        })
    }else{
        alert('비밀번호는 8~15글자 대/소문자 숫자\n특수문자가 들어가야합니다.')
    }
    }else{
        alert('비밀번호가 일치하지 않습니다.');
    }
});


$('.dropMember').on('click',function(){
    if(confirm('정말 탈퇴하시겠습니까?')){
        const memberNo = $('#memberNo').val();
        location.href="/dropMember.do?memberNo="+memberNo;
    }
});

$('.email2').on('focusin',function(){
    if($(this).val() != ''){
        $(this).css('border-bottom','2px');
    }
})

//페이지 로드가 되면 상대방이 보낸 1대1 대화가 있는지 체크하는 구문
$(function(){
    const chatActivation = $('.chatActivation').val();
    
    
    
    const memberId = $('#memberId').val();
    const chatChkSpan = $('.chatChkSpan');
    $.ajax({
        url : "selectChatData.do",
        type : "POST",
        data : {memberId : memberId},
        success : function(data){
            console.log("data : "+data);
            // console.log("data senderCheck : "+data.senderCheck);
            if(data != null && data.senderCheck == 2){
                chatChkSpan.text("[1]");
            }else{
                chatChkSpan.text("");
            }
        }
        
    })
    console.log("$(function(){}) : "+memberId);
    if(chatActivation == 1){
        $('[name=startChatBtn]').click();
    }else{
        $('[name=endChatBtn').click();
        $('.sendBox').slideUp();
    }
    console.log("chatActivation : "+chatActivation);

})


$('.orderDetailBtn').on('click',function(){
    const orderNo = $(this).val();
    console.log("orderNo : "+orderNo);
    location.href= "/myOrderDetail.do?orderNo="+orderNo;
})

function endChatBtn(param){
    const endMemberId = param;
    $.ajax({
        url : "/endChat.do",
        type : "POST",
        data : {memberId:endMemberId},
        success : function(param){
            if(param == "ok"){
                $('[name=startChatBtn]').slideDown();
                $('[name=endChatBtn]').slideUp();
                $('.messageArea').empty();
                $('#sendMsg').val("");
                $('#sendMsg').attr('readonly',true);
                const data = {type:"endChatBtn",msg:endMemberId};
                ws.send(JSON.stringify(data));
                console.log('endChatBtn 전송완료');
                $('.messageArea').css('background-color','rgba(0,0,0,0.5)');
                $('.sendBox').slideUp();
            }else{
                alert('잠시후 다시 시도해주세요.');
            }
        }
    })
}  

function startChatBtn(myPageMemberId){
    const jsMemberId = myPageMemberId;
    $.ajax({
        url : "/chat.do",
        type : "POST",
        data : {memberId:jsMemberId},
        success : function(result){
            console.log(result);
            if(result !="caOk"){
                alert("관리자에게 문의하세요");
            }else{
                chatList(jsMemberId);
                $('[name=startChatBtn]').slideUp();
                $('[name=endChatBtn]').slideDown();
                $('#sendMsg').attr('readonly',false);
                // $('.chatting').slideDown();
                const data = {type:"startChatBtn",msg:jsMemberId};
                console.log(ws);
                ws.send(JSON.stringify(data));
                console.log("data 전송 완료 startChatBtn");
                $('.messageArea').css('background-color',"#fff");
                $('.sendBox').slideDown();
            }
        }
    })
}

$(function(){
    const tabNo = $('.tabNo').val();
        $('.tab-content>li').eq(tabNo).click();
})


$('#sendMsg').on('click',function(){
    if($('#sendMsg').attr('readonly')){
        if(confirm('채팅이 종료되어있습니다\n활성화 하시겠습니까?')){
            $('[name=startChatBtn]').click();
        };
    }
})