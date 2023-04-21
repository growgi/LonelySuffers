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

/*모달*/
$(function () {
  $(document).on("click", ".modal-open-btn", function () {
    $(".product-info *").remove(); //모달 내용 초기화
    $($(this).attr("target")).css("display", "flex"); //모달 보이기
    //모달에 보이게 할 값들
    const img = $(this).parent().parent().find("img").clone();
    const title = $(this).parent().parent().find("a").eq(0).text();
    const writer = $(this).parent().parent().find("td").eq(4).text();
    //전달할 값
    const productType = $(this).parent().parent().find("td").eq(1).text(); //상품 종류
    const productNo = $(this).prev().val();
    
    //console.log(productType);
    //console.log(productNo);
    
    $(".product-info").append(img);
    $(".product-info").append("<div>"+title+"</div><div>판매자 : "+writer+"</div>");
	  
	  $(".returnProduct").on("click",function(){
		  const returnReason = $(".return-reason").val();
		  //console.log(returnReason);
		  returnProduct(productType, productNo, returnReason);
	  });
  });
  
  $(document).on("click", ".modal-close", function () {
    $(this).parents(".modal-wrap").parent().css("display", "none");
  });  
  
  $(".sub-navi").prev().after("<span class='material-icons dropdown'>expand_more</span>");
});

/*승인*/
//1개
$(".approveProduct").on("click", function() {
    //상품 종류
    //const productType = $(this).parents(".list-top").children("[type=hidden]").val();
    const productType = $(this).parent().parent().find("td").eq(1).text(); //상품 종류
    
    console.log(productType);
    
    //클릭한 버튼 기준으로 해당 상품 번호
    const productNo = $(this).next().val();

    location.href = "/approveProduct.do?productType="+productType+"&productNo="+productNo;
});

//체크박스 선택상품
$(".checkedApproveProduct").on("click", function() {
    //상품 종류
    const productType = $(this).parent().parent().prev().find("td").eq(1).text();
    
    //console.log(productType);
    
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
function returnProduct(productType,productNo,returnReason) {
    //상품 종류
    //const productType = $(this).parents(".list-top").children("[type=hidden]").val();
    //const productType = $(this).parent().parent().parent().next().next().find(".list-top").children("[type=hidden]").val();
    console.log(productType);
    
    //클릭한 버튼 기준으로 해당 상품 번호
    //const productNo = $(this).prev().val();
    console.log(productNo);
    
    //반려하는 이유
	//const returnReason = $(".return-reason");
	console.log(returnReason);

    location.href = "/returnProduct.do?productType="+productType+"&productNo="+productNo+"&returnReason="+returnReason;
};

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