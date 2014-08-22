function initTooltip() {
	if ($(".fa-bolt").length < 0) {
		$(".fa-bolt").tooltip("System-wide administrator");
	}
}

$(document).ready(initTooltip());