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
            $('#findMemberName').val('');
            $('#findMemberEmail').val('');
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


//아이디 비밀번호 정보 쿠키에 저장하는 jQuery
$(function() {
    fnInit();
  });
  
  function frm_check() {
    saveid();
    savepw();
  }
  
  function fnInit() {
    var cookieid = getCookie("saveid");
    var cookiepw = getCookie("savepw");
    if (cookieid != "") {
      $("input:checkbox[id='saveId']").prop("checked", true);
      $('#memberId').val(cookieid);
    }
    if (cookiepw != "") {
      $("input:checkbox[id='savePw']").prop("checked", true);
      $('#memberPw').val(cookiepw);
    }
  }
  
  function setCookie(name, value, expiredays) {
    var todayDate = new Date();
    todayDate.setTime(todayDate.getTime() + 0);
    if (todayDate > expiredays) {
      document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
    } else if (todayDate < expiredays) {
      todayDate.setDate(todayDate.getDate() + expiredays);
      document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
    }
  }
  
  function getCookie(Name) {
    var search = Name + "=";
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
      offset = document.cookie.indexOf(search);
      if (offset != -1) { // 쿠키가 존재하면 
        offset += search.length;
        // set index of beginning of value
        end = document.cookie.indexOf(";", offset);
        // 쿠키 값의 마지막 위치 인덱스 번호 설정 
        if (end == -1)
          end = document.cookie.length;
        return unescape(document.cookie.substring(offset, end));
      }
    }
    return "";
  }
  
  function saveid() {

    var expdate = new Date();
    if ($("#saveId").is(":checked")) {
      expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 10); //맨뒤에 10은 10일동안쿠키에 저장한다는 뜻
      setCookie("saveid", $("#memberId").val(), expdate);
    } else {
      expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 10);
      setCookie("saveid", $("#memberId").val(), expdate);
    }
  }
  
  function savepw() {
    var expdate = new Date();
    if ($("#savePw").is(":checked")) {
      expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 10);
      setCookie("savepw", $("#memberPw").val(), expdate);
    } else {
      expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 10);
      setCookie("savepw", $("#memberPw").val(), expdate);
    }
  }

  $('#findMemberEmail').on('keyup',function(e){
    if(e.keyCode == 13){
    $('.selectIdBtn').click();
    }
  })