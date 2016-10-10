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
						    <div class="swiper-wrapper">
						        <div class="swiper-slide">
						        	<div class="row menu-category-parent">
						        		<div class="col-sm-2 col-sm-offset-1">
						        			<button class="btn btn-default btn-lg btn-block">Sweet chili</button>
							        	</div>
							        	<div class="col-sm-2">
							        		<button class="btn btn-default btn-lg btn-block">테스2</button>
							        	</div>
							        	<div class="col-sm-2">
							        		<button class="btn btn-default btn-lg btn-block">테스2</button>
							        	</div>
							        	<div class="col-sm-2">
							        		<button class="btn btn-default btn-lg btn-block">테스2</button>
							        	</div>
							        	<div class="col-sm-2">
							        		<button class="btn btn-default btn-lg btn-block">테스2</button>
							        	</div>
						        	</div>
						        </div>
						    </div>
						    <!-- Add Pagination -->
						    <div class="swiper-pagination"></div>
						</div> <!-- End Swiper -->
					</div>
					<div class="row">
						<!-- Swiper -->
						<div class="swiper-container">
						    <div class="swiper-wrapper">
						        <div class="swiper-slide">
						        	<div class="row">
						        		<div class="col-sm-2 col-sm-offset-1">
						        			<button class="btn btn-default btn-lg btn-block">테스2</button>
							        	</div>
							        	<div class="col-sm-2">
							        		<button class="btn btn-default btn-lg btn-block">테스2</button>
							        	</div>
							        	<div class="col-sm-2">
							        		<button class="btn btn-default btn-lg btn-block">테스2</button>
							        	</div>
							        	<div class="col-sm-2">
							        		<button class="btn btn-default btn-lg btn-block">테스2</button>
							        	</div>
							        	<div class="col-sm-2">
							        		<button class="btn btn-default btn-lg btn-block">테스2</button>
							        	</div>
						        	</div>
						        	<div class="row">
						        		<div class="col-sm-2 col-sm-offset-1">
						        			<button class="btn btn-default btn-lg btn-block">테스2</button>
							        	</div>
							        	<div class="col-sm-2">
							        		<button class="btn btn-default btn-lg btn-block">테스2</button>
							        	</div>
							        	<div class="col-sm-2">
							        		<button class="btn btn-default btn-lg btn-block">테스2</button>
							        	</div>
							        	<div class="col-sm-2">
							        		<button class="btn btn-default btn-lg btn-block">테스2</button>
							        	</div>
							        	<div class="col-sm-2">
							        		<button class="btn btn-default btn-lg btn-block">테스2</button>
							        	</div>
						        	</div>
						        </div>
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
		 <!-- Initialize Swiper -->
	    <script type="text/javascript">
	    	$(function() {
	    		var swiper = new Swiper('.swiper-container', {
			        pagination: '.swiper-pagination',
			        paginationClickable: false
			    });
			    
			    $(".swiper-slide").click(function() {
			    	var sum = 0;
			    	$(".table-orderlist").find("tbody").find("tr td:last-child").each(function() {
			    		var value = $(this).text();
			    		if(!isNaN(value) && value.length != 0) {
			    			sum += parseFloat(value);
			    		}
			    	});
			    	$("#cost").text(sum.toFixed(2));
			    });
			    
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
			    	menu.setMenu_type("${ m.menu_type }");
			    	menus.push(menu);
			    </c:forEach>
			    
			    for(var i=0; i<menus.length; i++) {
			    	if(!menu_category.includes(menus[i].getMenu_type())) {
			    		menu_category.push(menus[i].getMenu_type());
			    	}
			    }
			    
			    $(".menu-category-parent").find("button").each(function(index) {
			    	$(this).text(menu_category[index]);
			    });
			    
			    /* for(var menu in menus) {
			    	alert(menu.getMenu_type);
			    }; */
			    
			    
	    	});
	    </script>
	</body>
</html>