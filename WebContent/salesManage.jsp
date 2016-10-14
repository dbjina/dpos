<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=500, initial-scale=1">
		<title>${ initParam.BRAND }</title>
		<c:import url="/include/cssLoad.jsp"></c:import>
	</head>
	<body>
		<c:import url="/include/adminNav.jsp"></c:import>
		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12 col-sm-8 menu-category">
					<div class="row">
						<!-- Swiper -->
						<div class="swiper-container swiper-parent">
						    <div class="swiper-wrapper menu-category-parent">
						        
						    </div>
						    <!-- Add Pagination -->
						    <div class="swiper-pagination"></div>
						</div> <!-- End Swiper -->
					</div>
					<div class="row">
						<!-- Swiper -->
						<div class="swiper-container swiper-child">
						    <div class="swiper-wrapper menu-category-child">
						        
						    </div>
						    <!-- Add Pagination -->
						    <div class="swiper-pagination"></div>
						</div> <!-- End Swiper -->
					</div>
				</div>
				<div class="col-xs-12 col-sm-4">
					<div class="row dpos-table-fixed-header">
						<table class="table table-orderlist">
						  	<thead>
						  		<tr>
						  			<th colspan="3"><h4><small>Table : </small><span id="dpos-table_number">0</span></h4></th>
						  		</tr>
							    <tr>
							    	<th class="hidden">Order Seq</th>
							        <th class="col-sm-2">Qty</th>
							        <th class="col-sm-7">Name</th>
							        <th class="col-sm-3">Price</th>
							    </tr>
						    </thead>
						    <tbody>
						    	
						    </tbody>
						</table>
					</div>
				</div>	
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-8">
					<div class="row text-center bg-info dpos-cost-info">
						<h3 class="dpos-text-middle">$ <span id="dpos-cost">0</span></h3>
					</div>
					<div class="row dpos-function-pad">
						<button class="col-md-2 btn btn-default disabled">Table</button>
						<button class="col-md-2 btn btn-default disabled">Pre print</button>
						<button class="col-md-2 btn btn-default disabled">Re print</button>
						<button class="col-md-2 btn btn-default disabled">Discount</button>
						<button class="col-md-2 btn btn-default disabled">Surcharge</button>
					</div>
				</div>
				<!-- Ten keys UI start -->
				<div class="col-xs-12 col-sm-4">
					<div class="row">
						<table class="table table-bordered dpos-tenkeys-pad">
							<thead>
								<tr>
									<th colspan="5" class="text-right" id="display-input">0</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><button class="btn btn-default btn-block">Void</button></td>
						    		<td><button class="btn btn-default btn-block">Void All</button></td>
						    		<td><button class="btn btn-default btn-block disabled">Cancel</button></td>
						    		<td><button class="btn btn-default btn-block disabled">Recall</button></td>
						    		<td><button class="btn btn-default btn-block disabled">Send Order</button></td>
								</tr>
								<tr>
									<td><button class="btn btn-default btn-block">$ 5</button></td>
									<td><button class="btn btn-default btn-block">7</button></td>
									<td><button class="btn btn-default btn-block">8</button></td>
									<td><button class="btn btn-default btn-block">9</button></td>
									<td><button class="btn btn-default btn-block">Clear</button></td>
								</tr>
								<tr>
									<td><button class="btn btn-default btn-block">$ 10</button></td>
									<td><button class="btn btn-default btn-block">4</button></td>
									<td><button class="btn btn-default btn-block">5</button></td>
									<td><button class="btn btn-default btn-block">6</button></td>
									<td><button class="btn btn-default btn-block">Card</button></td>
								</tr>
								<tr>
									<td><button class="btn btn-default btn-block">$ 20</button></td>
									<td><button class="btn btn-default btn-block">1</button></td>
									<td><button class="btn btn-default btn-block">2</button></td>
									<td><button class="btn btn-default btn-block">3</button></td>
									<td rowspan="2"><button class="btn btn-default btn-block">Cash</button></td>
								</tr>
								<tr>
									<td><button class="btn btn-default btn-block">$ 50</button></td>
									<td><button class="btn btn-default btn-block">X</button></td>
									<td><button class="btn btn-default btn-block">0</button></td>
									<td><button class="btn btn-default btn-block">.</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/include/menuOrderModalForm.jsp"></c:import>
		<c:import url="/include/jsLoad.jsp"></c:import>
		 
	    <script type="text/javascript">
	    	$(function() {
	    		
	    		// Field
	    		var ordered_menu = [];
	    		var menus = [];						// it stores all menu objects
			    var menu_category = [];				// the names of menu category without duplication
			    var menu_names_by_category = new Map();	// the menu names without duplication ("menu category name", Set({[], []}) )
			    var str = "";
			    
			    var ordered_list_table = $(".table-orderlist");
			    
			    menus = loadAllMenu();
			    menu_category = loadMenuCategoryName(menus);
			    menu_names_by_category = loadMenuName(menus, menu_category);
			    
			    makeOrderHightlightByClick(ordered_list_table,"bg-danger");
			    
			    loadTenkeysFunc(ordered_list_table, $(".dpos-tenkeys-pad"));
			    writeMenuCategories(".menu-category-parent", menu_category);
			    
				/* Initialize Swiper */
				var swiper = new Swiper('.swiper-parent', {
			        pagination: '.swiper-pagination',
			        paginationClickable: false
			    });
			    
				$(".menu-category-parent").on('click', 'button', function() {
					var current_category_name = $(this).text();
					$(this).addClass("active");
					
					$(".menu-category-parent").find("button").each(function() {
						if(current_category_name != $(this).text()) {
							$(this).removeClass("active");
						}
					});
					
					// Write menu names
					var str = "";
				    var current_menu_names = menu_names_by_category.get(current_category_name);
				    var arr = Array.from(current_menu_names);
				    for(var i=0, j=0, k=0; i<arr.length; i++, j++, k++) {
				    	if(i % 10 == 0) {
				    		str = str + '<div class="swiper-slide">';
				    	}
				    	
				    	if(i % 5 == 0) {
				    			str = str + '<div class="row">';
		    						str = str + '<div class="col-sm-2 col-sm-offset-1">';
				    	}
				    	else {
				    				str = str + '<div class="col-sm-2">';
				    	}
				    					str = str + '<button class="btn btn-default btn-lg btn-block" data-toggle="modal" data-target="#menuOrderModalForm">' + arr[i] + '</button>';
						    		str = str + '</div>';
					    		
						if(k == 4 && k != 0) {
							k = -1;
								str = str + '</div>';
						}
						    		
			    		if(j == 9 && j != 0) {
			    			j = 0;
				    		str = str + '</div>';
			    		}
				    }
					
				    $(".menu-category-child").html(str);
					
					/* Initialize Swiper */
					var swiper2 = new Swiper('.swiper-child', {
				        pagination: '.swiper-pagination',
				        paginationClickable: false
				    });
					
					// .on 대신에 .click 써야함
					 
					$(".menu-category-child").find("button").click(function() {
						var menuOrderModalForm = $("#menuOrderModalForm"); 
						var menuSizes = new Set();
						var tempMenu = [];	// it stores clicked menus temporarily
						var menuName = $(this).text();
						str = "";
						
						$(menuOrderModalForm).find(".modal-title").text(menuName);
						menuSizes = loadMenuSizes(menus, menuName);
						
						$(menuOrderModalForm).find(".modal-body").find(".form-group").text("");
						
						menuSizes.forEach(function(value) {
							str = str + '<button class="btn btn-default dpos-btn-menu-size">' + value + '</button>';
						});
						
						$(menuOrderModalForm).find(".modal-body").find(".form-group").append(str);
						
						$(menuOrderModalForm).find("button").click(function() {
							var menuSize = $(this).text();
							
							for(var i=0; i<menus.length; i++) {
								if(menuSize == menus[i].getMenu_size() && menuName == menus[i].getMenu_name() && menus[i].getMenu_price_group_name() == "Normal") {
									var orderMenu = new OrderMenu();
									
									if(ordered_menu.length == 0) {
										orderMenu.setMenu_order_seq(ordered_menu.length);
									}
									else {
										orderMenu.setMenu_order_seq(ordered_menu[ordered_menu.length - 1].getMenu_order_seq() + 1);
									}

									orderMenu.setMenu_order_quantity(1);
									orderMenu.setMenu(menus[i]);
									ordered_menu.push(orderMenu);
									break;
								}
							}
							
							writeOrder(ordered_list_table);
							writeTotalCost($("#dpos-cost"));
							
							
							$("#menuOrderModalForm").modal('toggle');
						});
			    	});
			    });
				
			    function loadTenkeysFunc(order_table, tenKeys_table) {
					var input_text = $(this).text();
					
					$(tenKeys_table).find("tbody").on('click','button', function() {
				    	var key_input = $(this).text();
				    	var display_th = $(tenKeys_table).find("#display-input");
				    	
				    	
				    	if($.isNumeric(key_input)) {
							if($(display_th).text() != 0 || $(display_th).text() == "0.") {
								$(display_th).append(key_input);
							}
							else {
					    		$(display_th).text(key_input);
							}
				    	}
				    	else if(key_input.toLowerCase() == ".") {
				    		if($(display_th).text().indexOf(".") == -1) {
					    		$(display_th).append(key_input);
				    		}
				    	}
				    	else if(key_input.toLowerCase() == "x") {
				    		changeOrderQuantity(order_table, display_th);
				    	}
				    	else if(key_input.toLowerCase() == "clear") {
				    		$(display_th).text("0");
				    	}
				    	else if(key_input.toLowerCase() == "void") {
			    			deleteOrder(order_table);
				    	}
				    	else if(key_input.toLowerCase() == "void all") {
				    		var check = confirm("Are you sure to delete all items?");
				    		
				    		if(check == true) {
					    		makeHightlightAll(order_table, "bg-danger");
					    		deleteAllOrder(order_table);
				    		}
						}
				    	else if(key_input.toLowerCase() == "cancel") {
				    		alert("the function hasn't been made");
				    	}
						else if(key_input.toLowerCase() == "recall") {
							alert("the function hasn't been made");
				    	}
						else if(key_input.toLowerCase() == "send order") {
							alert("the function hasn't been made");
				    	}
						else if(key_input.toLowerCase() == "card") {
							alert("the function hasn't been made");
				    	}
						else if(key_input.toLowerCase() == "cash" || key_input == "$ 5" || key_input == "$ 10" || key_input == "$ 20" || key_input == "$ 50") {
							if($(order_table).find("tbody").find("tr").length == 0) {
								return;	
							}
							
							var input_money;
							var cost = $("#dpos-cost").text();

							if(key_input != "cash") {
								input_money = key_input.substr(key_input.indexOf(" ") + 1);
							}
							else {
								input_money = $(display_th).text();
							}
				    		
							if(input_money == 0) {
				    			alert("paid all");
				    		}
				    		else {
				    			alert(input_money + " - " + cost + " = " + (input_money - cost));
				    			$(display_th).text(0);
				    		}
				    			
							// TODO
				    			// sendOrder();
				    			deleteAllOrder(order_table);
				    	}
					});
			    }
			    
			    
			    /* Return an array of the menu */
			    function loadAllMenu() {
			    	var menus = [];
			    	var menu = null;
			    	<c:forEach var="m" items="${ listMenu }">
			        	menu = new Menu();

			        	menu.setMenu_seq("${ m.menu_seq }");
			        	menu.setMenu_name("${ m.menu_name }");
			        	menu.setMenu_description("${ m.menu_description }");
			        	menu.setMenu_recipe("${ m.menu_recipe }");
			        	menu.setMenu_type_seq("${ m.menu_type_seq }");
			        	menu.setMenu_type("${ m.menu_type }");
			        	menu.setMenu_price_seq("${ m.menu_price_seq }");
			        	menu.setMenu_price("${ m.menu_price }");
			        	menu.setMenu_size_seq("${ m.menu_size_seq }");
			        	menu.setMenu_size("${ m.menu_size }");
			        	menu.setMenu_price_group_seq("${ m.menu_price_group_seq }");
			        	menu.setMenu_price_group_name("${ m.menu_price_group_name }");

			        	menus.push(menu);
			    	</c:forEach>
			    	return menus;
			    }
			    
			    function loadMenuCategoryName(menus) {
					var menu_category = [];
			    	for(var i=0; i<menus.length; i++) {
				    	if(!menu_category.includes(menus[i].getMenu_type())) {
				    		menu_category.push(menus[i].getMenu_type());
				    	}
				    }	
			    	return menu_category;
			    }
			    
			    function loadMenuName(menus, menu_category) {
					var menu_names_by_category = new Map();
			    	
					for(var i=0; i<menu_category.length; i++) {
						menu_names_by_category.set(menu_category[i], new Set());
					}
					
					for(var i=0; i<menus.length; i++) {
						menu_names_by_category.get(menus[i].getMenu_type()).add(menus[i].getMenu_name());
					}
					
			    	return menu_names_by_category;
			    }
			    
			    function loadMenuSizes(menus, menuName) {
					var menuSizes = new Set();
					
					for(var i=0; i<menus.length; i++) {
						if(menus[i].getMenu_name() == menuName) {
							menuSizes.add(menus[i].getMenu_size());
						}
					}
					
					return menuSizes;
				}
			    
			    /* Write menu categories on a target */
			    function writeMenuCategories(target, menu_category) {
					var str = "";			    	
			    	for(var i=0, j=0; i<menu_category.length; i++, j++) {
				    	if(i % 5 == 0) {
				    		str = str + '<div class="swiper-slide">';
				    			str = str + '<div class="row">';
				    				str = str + '<div class="col-sm-2 col-sm-offset-1">';
				    	}
				    	else {
				    				str = str + '<div class="col-sm-2">';
				    	}
				    					str = str + '<button class="btn btn-default btn-lg btn-block" data-toggle="button">' + menu_category[i] + '</button>';
						    		str = str + '</div>';
					    		
						
			    		if(j == 4 && j != 0) {
			    			j = 0;
			    				str = str + '</div>';
				    		str = str + '</div>';
			    		}
				    }
					$(target).html(str);
			    }
			    
			    function writeOrder(target_table) {
					var om = ordered_menu[ordered_menu.length - 1];
					
					str = "";
					str = str + "<tr>";
						str = str + "<td class='hidden'>";
						str = str + om.getMenu_order_seq();
						str = str + "</td>";
						str = str + "<td class='col-sm-2 text-primary'>";
							str = str + om.getMenu_order_quantity();						
						str = str + "</td>";
						str = str + "<td class='col-sm-7'>";
							str = str + om.getMenu().getMenu_name();							
						str = str + "</td>";
						str = str + "<td class='col-sm-3 text-primary'>";
							str = str + om.sum();
						str = str + "</td>";
					str = str + "</tr>";
					str = str + "<tr>";
						str = str + "<td class='hidden'>";
						str = str + "</td>";
						str = str + "<td class='col-sm-2'>";
						str = str + "</td>";
						str = str + "<td class='col-sm-7'>";
							str = str + " - " + om.getMenu().getMenu_size();
						str = str + "</td>";
						str = str + "<td class='col-sm-3'>";
							if(om.getMenu_order_quantity() != 1) {
								str = str + om.getMenu().getMenu_price();	
							}
						str = str + "</td>";
					str = str + "</tr>";
					$(target_table).find("tbody").prepend(str);
				}
			    
				function changeOrderQuantity(target_table, display_th) {
					
					$(target_table).find("tbody").find(".bg-danger").each(function() {
						var target_seq = $(this).find("td:nth-child(1)").text();
						var quantity = parseInt($(display_th).text());
						
						ordered_menu[target_seq].setMenu_order_quantity(quantity);
		    			$(this).find("td:nth-child(2)").text(quantity);
		    			$(this).find("td:nth-child(4)").text(ordered_menu[target_seq].sum());
		    			$(this).next().find("td:nth-child(4)").text(ordered_menu[target_seq].getMenu().getMenu_price());
		    		});
		    		$(display_th).text("0");
		    		$(target_table).find("tbody").find(".bg-danger").each(function() {
		    			$(this).removeClass("bg-danger").fadeOut(100).fadeIn(600);
		    			$(this).next().fadeOut(100).fadeIn(600);
		    		});
		    		
		    		writeTotalCost($("#dpos-cost"));
				}			  
				
				function deleteOrder(target_table) {
					$(target_table).find("tbody").find(".bg-danger").each(function() {
						var seq = $(this).find("td:nth-child(1)").text();
						ordered_menu.splice(seq, 1);
						$(this).next().fadeOut(500).remove();
		    			$(this).fadeOut(500).remove();
					});
				}
				
				function deleteAllOrder(target_table) {
					$(target_table).find("tbody").find("tr").each(function() {
						ordered_menu = [];
						$(this).next().fadeOut(500).remove();
		    			$(this).fadeOut(500).remove();
		    			writeTotalCost($("#dpos-cost"));
					});
				}
				
			    
				// TODO 세금, 할인 금액 등 다른 정보도 표시
			    function writeTotalCost(target) {
			    	var cost = 0;
			    	
			    	ordered_menu.forEach(function(value) {
			    		cost = cost + (value.getMenu_order_quantity() * value.getMenu().getMenu_price()); 
			    	});
			    	
			    	$(target).text(cost);
			    }
				
				function makeHightlightAll(table, cls) {
					$(table).find("tbody").find("tr").each(function() {
		    			var order_seq = $(this).find("td:nth-child(1)").text();
		    			
		    			if(order_seq) {
		    				$(this).addClass(cls);
		    			}
		    		});
				}
				
			    function makeOrderHightlightByClick(table, cls) {
		    		$(table).find("tbody").on('click', 'tr', function() {
		    			var order_seq = $(this).find("td:nth-child(1)").text();
		    			
		    			if(order_seq) {
		    				if($(this).hasClass(cls)) {
			    				$(this).removeClass(cls);
			    			}
			    			else {
			    				$(this).addClass(cls);
			    			}	
		    			}
		    		});
			    }
			    
			    function sendAllOrder(order_list_table) {
			    	// TODO
			    }
	    	});
	    </script>
	</body>
</html>