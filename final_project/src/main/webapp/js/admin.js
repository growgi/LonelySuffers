/*검색창 그림자*/
$(".search-bar>input").on("click",function(){
    $(this).toggleClass("active-search-bar");
});

/*상품 선택에 따라 리스트 조회*/
$(".product-choice>div").on("click",function(){
    $(".product-choice>div").removeClass("active-product-choice");
    $(this).addClass("active-product-choice");

    const num = $(".product-choice>div").index($(this));

    $(".list-wrapper").hide();
    $(".list-wrapper").eq(num).show();
});

/*상품리스트 상세설정*/
$(".list-detail").on("click",function(){
    $(".list-detail-box").fadeToggle(200);
});

$(".list-detail-box>div>a").on("click",function(){
    $(".list-detail-box").hide();
});