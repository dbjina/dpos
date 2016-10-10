/*!
 * author : dbjina (dbjina@gmail.com)
 * Copyright since 2016
 * Licensed under the MIT license
 */

/*
 * Make highlight when a table is on mouse up
 * @param table a table object
 * @param cls a class name that will be attached to each of tr of the table object
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