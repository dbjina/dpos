/*!
 * author : dbjina (dbjina@gmail.com)
 * Copyright since 2016
 * Licensed under the MIT license
 */
function makeTableHightlightByClick(table, cls) {
	$(function() {
		$(table).find("tbody").find("tr").mouseup(function() {
			if($(this).hasClass(cls)) {
				$(this).removeClass(cls);
			}
			else {
				$(this).addClass(cls);
			}
		});
	});
}