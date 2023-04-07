$('.tab-content>li').on('click',function(){
    const index = $('.tab-content>li').index(this);
    $('.tab-content>li').removeClass('li-active');
    $('.tab-content>li').eq(index).addClass('li-active');
})

$('.myProfile>ul>li').on('click',function(){
    const index = $('.myProfile>ul>li').index(this);
    if(index == 0 || index == 2 || index == 4){
        $('.myProfile>ul>li').eq(1).addClass('hidden-li');
        $('.myProfile>ul>li').eq(3).addClass('hidden-li');
        $('.myProfile>ul>li').eq(5).addClass('hidden-li');
        $('.myProfile>ul>li').eq(index+1).toggleClass('hidden-li');
    }
})

$('.tab-content>li').eq(0).click();
$('.myProfile>ul>li').eq(0).click();

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
                    location.href= "/myPage.do"
                }
            }
        })
    }
    }else{
        alert('비밀번호가 일치하지 않습니다.');
    }
});

$('.sellerBtn').on('click',function(){
    const memberNo = $('#memberNo').val();
    $.ajax({
        url : "/sellerApplication.do",
        type : "POST",
        data : {memberNo:memberNo},
        success : function(data){
            if(data == 'true'){
                alert("판매자 신청을 완료했습니다.");
                location.href= "/myPage.do"
            }else{
                alert("판매자 신청에 실패했습니다.")
            }
        }
    })
});

$('.cancelSellerBtn').on('click',function(){
    const memberNo = $('#memberNo').val();
    location.href="/cancelSeller.do?memberNo="+memberNo;
})