/*메뉴 제목*/
$(document).ready(function() {
    $(".top-menu-title").text("신규 상품 승인");
});

/*강습 체크박스 전체 선택*/
$(".lesson-all-check").on("click", function() {
    if ($(".lesson-all-check").is(":checked")) {
        $(".lesson-check").prop("checked", true)
    } else {
        $(".lesson-check").prop("checked", false)
    }
});

/*숙박 체크박스 전체 선택*/
$(".house-all-check").on("click", function() {
    if ($(".house-all-check").is(":checked")) {
        $(".house-check").prop("checked", true)
    } else {
        $(".house-check").prop("checked", false)
    }
});

/*승인*/
//1개
$(".approveProduct").on("click", function() {
    //상품 종류
    const productType = $(this).parents(".list-top").children("[type=hidden]").val();
    
    //클릭한 버튼 기준으로 해당 상품 번호
    const productNo = $(this).next().val();

    location.href = "/approveProduct.do?productType="+productType+"&productNo="+productNo;
});

//체크박스 선택상품
$(".checkedApproveProduct").on("click", function() {
    //상품 종류
    const productType = $(this).parent().parent().parent().children(".list-top").children("[type=hidden]").val();
    
    console.log(productType);
    
    const check = $(".check:checked");

    if (check.length == 0) {
        alert("선택된 회원이 없습니다.");
        return;
    }

    //체크된 상품 번호 저장 배열
    const no = new Array();

    //체크된 체크박스 기준으로 해당 상품 번호를 찾아서 배열에 넣는 작업
    check.each(function(index, item) {
        //클릭한 버튼 기준으로 해당 상품 번호
        const productNo = $(item).val();
        console.log(productNo);
        no.push(productNo);
    });

    location.href = "/checkedApproveProduct.do?productType="+productType+"&no=" + no.join("/");
});

/*반려*/
//1개
$(".returnProduct").on("click", function() {
    //상품 종류
    const productType = $(this).parents(".list-top").children("[type=hidden]").val();
    
    console.log(productType);
    
    //클릭한 버튼 기준으로 해당 상품 번호
    const productNo = $(this).prev().val();

    location.href = "/returnProduct.do?productType="+productType+"&productNo="+productNo;
});

//체크박스 선택상품
$(".checkedReturnProduct").on("click", function() {
    //상품 종류
    const productType = $(this).parent().parent().parent().children(".list-top").children("[type=hidden]").val();

    const check = $(".check:checked");

    if (check.length == 0) {
        alert("선택된 회원이 없습니다.");
        return;
    }

    //체크된 상품 번호 저장 배열
    const no = new Array();

    //체크된 체크박스 기준으로 해당 상품 번호를 찾아서 배열에 넣는 작업
    check.each(function(index, item) {
        //클릭한 버튼 기준으로 해당 상품 번호
        const productNo = $(item).val();
        no.push(productNo);
    });

    location.href = "/checkedReturnProduct.do?productType="+productType+"&no=" + no.join("/");
});