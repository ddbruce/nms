function run(id) {
	$(id)
	.transition({opacity: 1},1000,'in-out')
	.delay(5000)
	.transition({opacity: 0},1000,'in-out', function() {
		run(this.data('next'))
	});
}

$( document ).ready(function() {
	run('#news-0');
	topSpacing();
});

$(function(){
	var shrinkHeader = 50;
	$(window).scroll(function() {
		var scroll = getCurrentScroll();
		if ( scroll >= shrinkHeader ) {
			$('.logo').addClass('logoshrink')
			$('.header-row-1').addClass('headershrink');
		}
		else {
			$('.logo').removeClass('logoshrink')
			$('.header-row-1').removeClass('headershrink');
		}
	});

	function getCurrentScroll() {
		return window.pageYOffset || document.documentElement.scrollTop;
	}
});
function topSpacing() {
	var h = $("#header").height();
	$("#header-spacer").height(h+10);
}