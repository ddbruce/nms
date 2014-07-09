function run(id) {
	$(id)
	.transition({opacity: 1},1000,'in-out')
	.delay(5000)
	.transition({opacity: 0},1000,'in-out', function() {
		run(this.data('next'))
	});
}

$( document ).ready(function() {
	run('#news');
});