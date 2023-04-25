// 웹페이지 최상단으로 이동하는 함수
function scrollToTop() {
  document.body.scrollTop = 0;
  document.documentElement.scrollTop = 0;
}



(function ($) {
  "use strict";
  $('.site-header').affix({
    offset: {
      top: 100,
      bottom: function () {
        return (this.bottom = $('.footer').outerHeight(true))
      }
    }
  })

  $('[data-toggle="tooltip"]').tooltip();




// class가 stat-count인 숫자가 duration값(단위 ms) 동안 카운터 올라가는 함수 
$(document).ready(function(){
		
		$('.stat-count').each(function(){
	        $(this).prop('Counter',0).animate({
	            Counter: $(this).text()
	        },{
	            duration: 3500,
	            easing: 'swing',
	            step: function (now){
	                $(this).text(Math.ceil(now));
	            }
	        });
	    });
	    
});




})(jQuery);