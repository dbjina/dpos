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
					<div class="row table-header-fixed">
						<table class="table table-orderlist">
						  <thead>
							    <tr>
							        <th class="col-sm-2">Qty</th>
							        <th class="col-sm-4">Name</th>
							        <th class="col-sm-3">Price</th>
							    </tr>
						    </thead>
						    <tbody>
						    	<c:forEach begin="1" end="90" varStatus="status">
							    	<tr>
								        <td class="col-sm-2">${ status.index}</td>
								        <td class="col-sm-4">Escort</td>
								        <td class="col-sm-3">1.33</td>
								    </tr>
						    	</c:forEach>
						    </tbody>
					</table>
					</div>
					<div class="row">
						TOTAL : $ <span id="cost">0</span>
					</div>
				</div>	
			</div>
		</div>
	
		<c:import url="/include/jsLoad.jsp"></c:import>
		 
	    <script type="text/javascript">
	    	$(function() {
	    		
			    
			    function Menu() {
			    	var menu_seq;
			    	var menu_name;
			    	var menu_description;
			    	var menu_recipe;
			    	var menu_type_seq;
			    	var menu_type;
			    	var menu_price_seq;
			    	var menu_price;
			    	var menu_size_seq;
			    	var menu_size;
			    	var menu_price_group_seq;
			    	var menu_price_group_name;
			    	
			    	this.getMenu_seq = function() { return this.menu_seq; };
				    this.getMenu_name = function() { return this.menu_name; };
				    this.getMenu_description = function() { return this.menu_description; };
				    this.getMenu_recipe = function() { return this.menu_recipe; };
				    this.getMenu_type_seq = function() { return this.menu_type_seq; };
				    this.getMenu_type = function() { return this.menu_type; };
				    this.getMenu_price_seq = function() { return this.menu_price_seq; };
				    this.getMenu_price = function() { return this.menu_price; };
				    this.getMenu_size_seq = function() { return this.menu_size_seq; };
				    this.getMenu_size = function() { return this.menu_size; };
				    this.getMenu_price_group_seq = function() { return this.menu_price_group_seq; };
				    this.getMenu_price_group_name = function() { return this.menu_price_group_name; };
				    
				    this.setMenu_seq = function(value) { this.menu_seq = value; };
				    this.setMenu_name = function(value) { this.menu_name = value; };
				    this.setMenu_description = function(value) { this.menu_description = value; };
				    this.setMenu_recipe = function(value) { this.menu_recipe = value; };
				    this.setMenu_type_seq = function(value) { this.menu_type_seq = value; };
				    this.setMenu_type = function(value) { this.menu_type = value; };
				    this.setMenu_price_seq = function(value) { this.menu_price_seq = value; };
				    this.setMenu_price = function(value) { this.menu_price = value; };
				    this.setMenu_size_seq = function(value) { this.menu_size_seq = value; };
				    this.setMenu_size = function(value) { this.menu_size = value; };
				    this.setMenu_price_group_seq = function(value) { this.menu_price_group_seq = value; };
				    this.setMenu_price_group_name = function(value) { this.menu_price_group_name = value; };
			    }
			    
			    var menus = new Array();
			    var menu_category = new Array();
			    
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
			    
			    for(var i=0; i<menus.length; i++) {
			    	if(!menu_category.includes(menus[i].getMenu_type())) {
			    		menu_category.push(menus[i].getMenu_type());
			    	}
			    }
			    
			    // Write menu categories
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
			    					str = str + '<button class="btn btn-default btn-lg btn-block">' + menu_category[i] + '</button>';
					    		str = str + '</div>';
				    		
					
		    		if(j == 4 && j != 0) {
		    			j = 0;
		    				str = str + '</div>';
			    		str = str + '</div>';
		    		}
			    }
				$(".menu-category-parent").html(str);
			    
			 	
			 
			 
			    
			    			
				/* Initialize Swiper */
				var swiper = new Swiper('.swiper-container', {
			        pagination: '.swiper-pagination',
			        paginationClickable: false
			    });
			    
				var menu_names_by_category;
				$(".menu-category-parent").find("button").click(function() {
					var menu_category_name = $(this).text();
					menu_names_by_category = new Array();
					
					for(var i=0; i<menus.length; i++) {
						if(menus[i].getMenu_type() == menu_category_name) {
							if(!menu_names_by_category.includes(menus[i].getMenu_name())) {
								menu_names_by_category.push(menus[i].getMenu_name());
					    	}	
						}
				    }
					
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
				    					str = str + '<button class="btn btn-default btn-lg btn-block">' + menu_names_by_category[i] + '</button>';
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