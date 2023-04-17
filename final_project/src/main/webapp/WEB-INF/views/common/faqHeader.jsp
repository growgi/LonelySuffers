<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<style>

.tabs>ul{
   	list-style-type: none;
   	overflow: hidden;
	}
.tabs>ul>li{
	width: calc(100%/6);
   	float: left;
   	height: 50px;
   	line-height: 30px;
   	border: 1px solid #ccc;
   	box-sizing: border-box;
   	text-align: center;
   	cursor: pointer;
}
</style>

		<section class="section normalhead lb">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 col-sm-12 text-center">
						<h2>자주묻는질문</h2>
						<hr>
					</div>
					<!-- end col -->
				</div>
				<!-- end row -->
			</div>
			<!-- end container -->
		</section>
		<!-- end section -->


		<section class="section">
			<div class="container">
				<div class="row">
					<div class="tabs">
						<ul>
							<li><a href="/faqListKind.do?categoryNo=1">예약취소</a></li>
							<li><a href="/faqListKind.do?categoryNo=2">숙박</a></li>
							<li><a href="/faqListKind.do?categoryNo=3">강습</a></li>
							<li><a href="/faqListKind.do?categoryNo=4">카풀</a></li>
							<li><a href="/faqListKind.do?categoryNo=5">후기</a></li>
							<li><a href="/faqListKind.do?categoryNo=6">회원서비스</a></li>
						</ul>
					</div>	
				</div><!-- end row -->
			</div><!-- end container -->
		</section><!-- end section -->

<script>
$(".tabs>li").on("click",function(){
    $(".tabs>li").removeClass("active-tab");
    $(this).addClass("active-tab");
    const contents = $(".tabcontent");
    contents.hide();
    //요소배열.index(요소) : 요소배열중 요소가 몇번째인지 찾아줄거야
    const index = $(".tabs>li").index(this);
    contents.eq(index).show();
});

$(".tabs>li").eq(0).click();
</script>