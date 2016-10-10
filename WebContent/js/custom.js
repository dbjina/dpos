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

function deleteItem(table, cls, seq_depth, name_depth, form, paramName, action) {
	var selected_trs = $(table).find("tbody").find("." + cls);
	var names = new Array();
	
	$(selected_trs).find("td:nth-child(" + name_depth + ")").each(function() {
		names.push($(this).text());
	})
	var isContinue = confirm("Would you like to delete the items below?\n" + names);
	
	if(isContinue == false) {
		return;
	}
	
	$(selected_trs).find("td:nth-child(" + seq_depth + ")").each(function() {
		$("<input type='hidden' value='" + $(this).text() + "' />")
	     .attr("name", paramName)
	     .appendTo(form);
	})
	     
	$(form).attr("action", action);
	$(form).submit();
}