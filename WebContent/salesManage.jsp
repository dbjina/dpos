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
						<div class="swiper-container">
						    <div class="swiper-wrapper menu-category-parent">
						        
						    </div>
						    <!-- Add Pagination -->
						    <div class="swiper-pagination"></div>
						</div> <!-- End Swiper -->
					</div>
					<div class="row">
						<!-- Swiper -->
						<div class="swiper-container">
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
							        <th class="col-sm-2">Qty</th>
							        <th class="col-sm-7">Name</th>
							        <th class="col-sm-3">Price</th>
							    </tr>
						    </thead>
						    <tbody>
						    	
						    </tbody>
					</table>
					</div>
					<div class="row">
						TOTAL : $ <span id="cost">0</span>
					</div>
				</div>	
			</div>
		</div>
		<c:import url="/include/menuOrderModalForm.jsp"></c:import>
		<c:import url="/include/jsLoad.jsp"></c:import>
		 
	    <script type="text/javascript">
	    	$(function() {
	    		
	    		// Field
			    var menu_category = [];	// the names of menu category without duplication
	    		var menus = [];			// it stores menu objects
			    var menu = null;					// Menu object (ref /js/Menu.js)
			    var swiper = null;					// Swiper object (ref /vendor/Swiper-3.3.1)
			    var menu_names_by_category;			// the menu names without duplication
			    var str = "";
			    
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
			    
			    for(var i=0; i<menus.length; i++) {
			    	if(!menu_category.includes(menus[i].getMenu_type())) {
			    		menu_category.push(menus[i].getMenu_type());
			    	}
			    }
			    
			    // Write menu categories
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
				$(".menu-category-parent").html(str);
			    
			 	
				/* Initialize Swiper */
				swiper = new Swiper('.swiper-container', {
			        pagination: '.swiper-pagination',
			        paginationClickable: false
			    });
			    
				
				$(".menu-category-parent").on('click', 'button', function() {
					var current_category = $(this).text();
					$(this).addClass("active");
					$(".menu-category-parent").find("button").each(function() {
						if(current_category != $(this).text()) {
							
							$(this).removeClass("active");
						}
					});
					var menu_category_name = $(this).text();
					menu_names_by_category = [];
					
					for(var i=0; i<menus.length; i++) {
						if(menus[i].getMenu_type() == menu_category_name) {
							if(!menu_names_by_category.includes(menus[i].getMenu_name())) {
								menu_names_by_category.push(menus[i].getMenu_name());
					    	}	
						}
				    }
				
				// .on 으로 대체 중
				// .on 이 .click에 비해서 메모리 적게 먹고, 네임스페이스 이용가능하고, 등등
				// 크롬 디버깅 툴로 메모리 용량 확인해보기
				/* $(".menu-category-parent").find("button").click(function() {
					var current_category = $(this).text();
					$(this).addClass("active");
					$(".menu-category-parent").find("button").each(function() {
						if(current_category != $(this).text()) {
							
							$(this).removeClass("active");
						}
					});
					var menu_category_name = $(this).text();
					menu_names_by_category = new Array();
					
					for(var i=0; i<menus.length; i++) {
						if(menus[i].getMenu_type() == menu_category_name) {
							if(!menu_names_by_category.includes(menus[i].getMenu_name())) {
								menu_names_by_category.push(menus[i].getMenu_name());
					    	}	
						}
				    } */
					
					// Write menu names
					var str = "";
				    for(var i=0, j=0, k=0; i<menu_names_by_category.length; i++, j++, k++) {
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
				    					str = str + '<button class="btn btn-default btn-lg btn-block" data-toggle="modal" data-target="#menuOrderModalForm">' + menu_names_by_category[i] + '</button>';
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
					swiper = new Swiper('.swiper-container', {
				        pagination: '.swiper-pagination',
				        paginationClickable: false
				    });
					
					// .on 대신에 .click 써야함
					$(".menu-category-child").find("button").click(function() {
						var menuOrderModalForm = $("#menuOrderModalForm"); 
						var menuSizes = [];
						var menuName = $(this).text();
						str = "";

						
						$(menuOrderModalForm).find(".modal-title").text(menuName);
						for(var i=0; i<menus.length; i++) {
							if(menus[i].getMenu_name() == menuName) {
								if(menuSizes.includes(menus[i].getMenu_size()) == false) {
									menuSizes.push(menus[i].getMenu_size());
								}
							}
						}
						
						$(menuOrderModalForm).find(".modal-body").find(".form-group").text("");
						
						for(var i=0; i<menuSizes.length; i++) {
							str = str + '<button class="btn btn-default dpos-btn-menu-size">' + menuSizes[i] + '</button>'; 								
						}
						
						$(menuOrderModalForm).find(".modal-body").find(".form-group").append(str);
						
						// TODO 주문된 목록에 객체 어떻게 넣을지 고민하기
						$(menuOrderModalForm).find("button").click(function() {
							str = "";
							str = str + "<tr>";
								str = str + "<td class='col-sm-2'>";
									str = str + "1";						
								str = str + "</td>";
								str = str + "<td class='col-sm-7'>";
									str = str + menuName;							
								str = str + "</td>";
								str = str + "<td class='col-sm-3'>";
									str = str + "0.99";							
								str = str + "</td>";
							str = str + "</tr>";
							$(".table-orderlist").find("tbody").prepend(str);
							$("#menuOrderModalForm").modal('toggle');
						});
						// 아래 코드는 사이즈 선택후에 실행되야 함
						/* var str = "";
						str = str + "<tr>";
							str = str + "<td>";
								str = str + "1";						
							str = str + "</td>";
							str = str + "<td>";
								str = str + $(this).text();							
							str = str + "</td>";
							str = str + "<td>";
								str = str + "0.99";							
							str = str + "</td>";
						str = str + "</tr>";
						$(".table-orderlist").find("tbody").prepend(str);	 */		    	
			    	});
			    });
				
				/* $(".swiper-slide").click(function() {
			    	var sum = 0;
			    	$(".table-orderlist").find("tbody").find("tr td:last-child").each(function() {
			    		var value = $(this).text();
			    		if(!isNaN(value) && value.length != 0) {
			    			sum += parseFloat(value);
			    		}
			    	});
			    	$("#cost").text(sum.toFixed(2));
			    }); */
			    
	    	});
	    </script>
	</body>
</html>