function initTooltip() {
  if ($(".fa-bolt").length) {
    $(".fa-bolt").tooltip("System Wide Administrator");
  }
}

$(document).ready(initTooltip);