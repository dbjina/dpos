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

// XXX mouseup 이벤트 보다는 .on 메소드로 대체하여 click 이벤트 적용, 테스트 중
/*function makeTableHightlightByClick(table, cls) {
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
}*/

function makeTableHightlightByClick(table, cls) {
	$(table).find("tbody").on('click', 'tr', function() {
		if($(this).hasClass(cls)) {
			$(this).removeClass(cls);
		}
		else {
			$(this).addClass(cls);
		}
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

Object.equals = function( x, y ) {
	if ( x === y ) return true;
	    // if both x and y are null or undefined and exactly the same
	
	if ( ! ( x instanceof Object ) || ! ( y instanceof Object ) ) return false;
	    // if they are not strictly equal, they both need to be Objects
	
	if ( x.constructor !== y.constructor ) return false;
	    // they must have the exact same prototype chain, the closest we can do is
	// test there constructor.
	
	for ( var p in x ) {
	    if ( ! x.hasOwnProperty( p ) ) continue;
	      // other properties were tested using x.constructor === y.constructor
	
	if ( ! y.hasOwnProperty( p ) ) return false;
	  // allows to compare x[ p ] and y[ p ] when set to undefined
	
	if ( x[ p ] === y[ p ] ) continue;
	  // if they have the same strict value or identity then they are equal
	
	if ( typeof( x[ p ] ) !== "object" ) return false;
	  // Numbers, Strings, Functions, Booleans must be strictly equal
	
	if ( ! Object.equals( x[ p ],  y[ p ] ) ) return false;
	  // Objects and Arrays must be tested recursively
	  }
	
	for ( p in y ) {
	    if ( y.hasOwnProperty( p ) && ! x.hasOwnProperty( p ) ) return false;
	      // allows x[ p ] to be set to undefined
	  }
	  return true;
}