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

/*강습 상품 상태 변경*/
//체크박스 선택상품
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
});

/*숙박 상품 상태 변경*/
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
        });

/*상품 판매 중지*/
$(".product-stop-selling").on("click",function() {
    const productType = $(this).parent().parent().parent().parent().find("td").eq(1).text(); //상품 종류
    const no = $(this).next().val();

    // console.log(productType);
    // console.log(no);

    location.href = "/productStopSelling.do?no="+no+"&productType="+productType;
});