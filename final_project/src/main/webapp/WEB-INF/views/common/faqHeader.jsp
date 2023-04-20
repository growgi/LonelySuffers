<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/resources/css/faq.css">
<style>

.tabs>ul{
   	list-style-type: none;
   	overflow: hidden;
	}
.tabs>ul>li{
	width: calc(100%/6);
   	float: left;
   	height: 50px;
   	line-height: 50px;
   	box-sizing: border-box;
   	text-align: center;
   	cursor: pointer;
}

.tabs>ul>li>a{
	font-weight: bold;
}


/* CSS */
.button-89 {
  --b: 3px;   /* border thickness */
  --s: .45em; /* size of the corner */
  --color: #373B44;
  
  padding: calc(.5em + var(--s)) calc(.9em + var(--s));
  color: var(--color);
  --_p: var(--s);
  background:
    conic-gradient(from 90deg at var(--b) var(--b),#0000 90deg,var(--color) 0)
    var(--_p) var(--_p)/calc(100% - var(--b) - 2*var(--_p)) calc(100% - var(--b) - 2*var(--_p));
  transition: .3s linear, color 0s, background-color 0s;
  outline: var(--b) solid #0000;
  outline-offset: .6em;
  font-size: 16px;

  border: 0;

  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
}

.button-89:hover,
.button-89:focus-visible{
  --_p: 0px;
  outline-color: var(--color);
  outline-offset: .05em;
}

.button-89:active {
  background: var(--color);
  color: #fff;
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


		<section class="section" style="padding-bottom: 0;">
			<div class="container">
				<div class="row">
					<div class="tabs">
						<ul>
							<li style="border-right: 1px solid #eee;">
								<a href="/faqListKind.do?categoryNo=1&reqPage=1" class="button-89" role="button">
								예약취소
								</a>
							</li>
							<li style="border-right: 1px solid #eee;">
								<a href="/faqListKind.do?categoryNo=2&reqPage=1" class="button-89" role="button">
								숙박
								</a>
							</li>
							<li style="border-right: 1px solid #eee;">
								<a href="/faqListKind.do?categoryNo=3&reqPage=1" class="button-89" role="button">
								강습
								</a>
							</li>
							<li style="border-right: 1px solid #eee;">
								<a href="/faqListKind.do?categoryNo=4&reqPage=1" class="button-89" role="button">
								카풀
								</a>
							</li>
							<li style="border-right: 1px solid #eee;">
								<a href="/faqListKind.do?categoryNo=5&reqPage=1" class="button-89" role="button">
								후기
								</a>
							</li>
							<li>
								<a href="/faqListKind.do?categoryNo=6&reqPage=1" class="button-89" role="button">
								회원서비스
								</a>
							</li>
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