/*검색창 그림자*/
$(".search-bar>input").on("click",function(){
    $(this).toggleClass("active-search-bar");
});


/*상품 선택에 따라 리스트 조회*/
$(".product-choice>div:first-of-type").on("click",function(){
    $(".product-choice>div").removeClass("active-product-choice");
    $(".product-choice>div:first-of-type").addClass("active-product-choice");

    $(".chk").prop("checked",false); //탭 이동하면 체크박스 초기화

    $(".house-list").hide();
    $(".lesson-list").show();
});

$(".product-choice>div:last-of-type").on("click",function(){
    $(".product-choice>div").removeClass("active-product-choice");
    $(".product-choice>div:last-of-type").addClass("active-product-choice");

    $(".chk").prop("checked",false); //탭 이동하면 체크박스 초기화

    $(".lesson-list").hide();
    $(".house-list").show();
});


/*상품리스트 상세설정*/
$(".list-detail").on("click",function(){
    $(".list-detail-box").toggle();
});

$(".list-detail-box>div>a").on("click",function(){
    $(".list-detail-box").hide();
});


/*체크박스 전체 선택*/
$(".all-check").on("click",function(){
    if($(".all-check").is(":checked")) {
        $(".check").prop("checked", true)
    } else {
        $(".check").prop("checked", false)
    }
});


/*등급 변경*/
//1명
$(".changeGrade").on("click",function(){
    //클릭한 버튼 기준으로 해당 회원 아이디
    const memberId = $(this).parent().parent().children().eq(2).text();

    //클릭한 버튼 기준으로 선택한 등급
    const memberGrade = $(this).parent().parent().find("select").val();

    location.href="/changeGrade.do?memberId="+memberId+"&memberGrade="+memberGrade;
});

//체크박스 선택회원
$(".checkedChangeGrade").on("click",function(){
    const check = $(".check:checked");

    if(check.length == 0) {
        alert("선택된 회원이 없습니다.");
        return;
    }

    //체크된 회원아이디 저장 배열
    const id = new Array();

    //체크된 회원등급 저장 배열
    const grade = new Array();

    //체크된 체크박스 기준으로 회원아이디, 등급을 찾아서 배열에 넣는 작업
    check.each(function(index,item){
        const memberId = $(this).parent().parent().children().eq(2).text();
        id.push(memberId);
        const memberGrade = $(this).parent().parent().find("select").val();
        grade.push(memberGrade);
    });

    location.href="/checkedChangeGrade.do?id="+id.join("/")+"&grade="+grade.join("/");
});


/*엔터키 치면 검색창 자동 submit*/
function enterkey() {
    if (window.event.keyCode == 13) {
         // 엔터키가 눌렸을 때 실행할 내용
        $("#frm").submit();
    }
}
//돋보기 클릭하면 검색창 submit
$(".search-icon").on("click",function(){
    $(".search-bar").submit();
});