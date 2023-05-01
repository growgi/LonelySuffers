/*검색창 그림자*/
$(".search-bar>input").on("click",function(){
    $(this).toggleClass("active-search-bar");
});

/*왼쪽 메뉴*/
$(".menu-detail-title").on("click",function(){
    $(this).addClass("active-menu-click");
});


/*상품 선택에 따라 리스트 조회
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
});*/


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



/*엔터키 치면 검색창 자동 submit*/
function enterkey() {
    if (window.event.keyCode == 13) {
         // 엔터키가 눌렸을 때 실행할 내용
        $("#frm").submit();
        $(".count").text("");
    }
}
//돋보기 클릭하면 검색창 submit
$(".search-icon").on("click",function(){
    $(".search-bar").submit();
});


