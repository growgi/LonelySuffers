/*메뉴 제목*/
$(function() {
    $(".top-menu-title").text("등록된 상품 관리");
    $(".product-choice>div").first().click();
    $(".menu-detail>li>a").eq(3).addClass("active-menu-click");
});

$(".more-detail").on("click", function() {
    $(this).next().fadeToggle();

    //다른 화면 클릭하면 list-detail-box 사라짐 -> 구현하기
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


//체크박스 선택상품
$(document).on("click", ".checkedUpdateProductStatus-btn", function () {
    const check = $(".product-check:checked");

    if (check.length == 0) {
        alert("선택된 상품이 없습니다.");
        return;
    }

    $($(this).attr("target")).css("display", "flex"); //모달 보이기

    //체크된 상품 번호 저장 배열
    const no = new Array();

    //체크된 상품 상태 저장 배열
    const status = new Array();

    //체크된 상품 타입 저장 배열
    const pType = new Array();

    //체크된 체크박스 기준으로 회원아이디, 등급을 찾아서 배열에 넣는 작업
    check.each(function(index, item) {
        const No = $(item).val();
        no.push(No);

        const Status = $(item).parent().parent().find('select')
                .val();
        status.push(Status);

        //상품 종류
        const productType = $(item).parent().next().text();
        pType.push(productType);
        
    });

    console.log("no:"+no);
    console.log("status:"+status);
    console.log("pType:"+pType);

    $(".checkedUpdateProductStatus-btn2").on("click",function() {
        location.href = "/checkedUpdateProductStatus.do?pType="+pType.join("/")+"&no="+no.join("/")+"&status="+status.join("/");
    });
});
$(document).on("click", ".modal-close", function () {
    $(this).parents(".modal-wrap").parent().css("display", "none");
});  

/*강습 상품 상태 변경
$(".checkedUpdateLessonStatus").on("click",function() {
    const check = $(".lesson-check:checked");

    if (check.length == 0) {
        alert("선택된 상품이 없습니다.");
        return;
    }

    //체크된 상품 번호 저장 배열
    const no = new Array();

    //체크된 상품 상태 저장 배열
    const status = new Array();

    //체크된 체크박스 기준으로 회원아이디, 등급을 찾아서 배열에 넣는 작업
    check.each(function(index, item) {
        const lNo = $(item).val();
        no.push(lNo);

        const lStatus = $(item).parent().parent().find('select')
                .val();
        status.push(lStatus);

    });

    location.href = "/checkedUpdateLessonStatus.do?no="
            + no.join("/") + "&status=" + status.join("/");
});*/

/*숙박 상품 상태 변경
//체크박스 선택상품
$(".checkedUpdateHouseStatus").on(
        "click",
        function() {
            const check = $(".house-check:checked");

            if (check.length == 0) {
                alert("선택된 상품이 없습니다.");
                return;
            }

            //체크된 상품 번호 저장 배열
            const no = new Array();

            //체크된 상품 상태 저장 배열
            const status = new Array();

            //체크된 체크박스 기준으로 회원아이디, 등급을 찾아서 배열에 넣는 작업
            check.each(function(index, item) {
                const hNo = $(item).val();
                no.push(hNo);

                const hStatus = $(item).parent().parent().find('select')
                        .val();
                status.push(hStatus);

            });

            location.href = "/checkedUpdateHouseStatus.do?no="
                    + no.join("/") + "&status=" + status.join("/");
        });*/

/*상품 판매 중지*/
$(".product-stop-selling-btn").on("click",function(){
    const result = confirm("해당 상품을 판매 중지하시겠습니까?");

    if(result == true) {
        $(this).next().click();
        alert("성공적으로 처리되었습니다.");
    } else {
        alert("해당 작업이 취소되었습니다.");
    }
});

$(".product-stop-selling").on("click",function() {
    const productType = $(this).parent().parent().parent().parent().find("td").eq(1).text(); //상품 종류
    const no = $(this).next().val();

    // console.log(productType);
    // console.log(no);

    location.href = "/productStopSelling.do?no="+no+"&productType="+productType;
});