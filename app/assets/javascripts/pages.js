function run() {
	$('#news').transition({opacity: 1},1000,'in-out').delay(5000).transition({opacity: 0},1000,'in-out', function() {
		$('#features').transition({opacity: 1},1000,'in-out').delay(5000).transition({opacity: 0},1000,'in-out', run);
	});
}

/*use data tag in html5 to call function*/ /*use function() {run(nextdivhere)};*/

$( document ).ready(function() {
	run();
});