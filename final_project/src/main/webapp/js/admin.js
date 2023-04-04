/*검색창 그림자*/
$(".search-bar>input").on("click",function(){
    $(this).toggleClass("active-search-bar");
});

/*상품 선택에 따라 리스트 조회*/
$(".product-choice>div").on("click",function(){
    $(".product-choice>div").removeClass("active-product-choice");
    $(this).addClass("active-product-choice");

    const num = $(".product-choice>div").index($(this));

    if(num == 1) {
        // $(this).parent().next().next().show();
        $(".list-wrapper").hide();
        $(".list-wrapper").eq(num).show();
    } else {
        $(".list-wrapper").hide();
        $(".list-wrapper").eq(num).show();
    }
});