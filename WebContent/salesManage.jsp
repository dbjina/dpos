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
			<div class="row menu">
				<div class="col-xs-12 col-sm-9">
					<div class="row menu-category">
						<!-- Swiper -->
						<div class="swiper-container">
						    <div class="swiper-wrapper text-center">
						        <div class="swiper-slide">
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        </div>
						        <div class="swiper-slide">
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        </div>
						        <div class="swiper-slide">
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        	<button class="btn btn-default btn-lg">큰분류1</button>
						        </div>
						    </div>
						    <!-- Add Pagination -->
						    <div class="swiper-pagination"></div>
						</div> <!-- End Swiper -->
					</div>
					<div class="row menu-menus">
						<!-- Swiper -->
						<div class="swiper-container">
						    <div class="swiper-wrapper text-center">
						        <div class="swiper-slide">
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        </div>
						        <div class="swiper-slide">
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        </div>
						        <div class="swiper-slide">
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        	<button class="btn btn-default btn-lg">메뉴1</button>
						        </div>
						    </div>
						    <!-- Add Pagination -->
						    <div class="swiper-pagination"></div>
						</div> <!-- End Swiper -->
					</div>
				</div>
				<div class="col-xs-12 col-sm-3 table-header-fixed">
					<table class="table">
						  <thead>
							    <tr>
							        <th class="col-sm-2">Qty</th>
							        <th class="col-sm-4">Name</th>
							        <th class="col-sm-3">Price</th>
							    </tr>
						    </thead>
						    <tbody>
						    	<c:forEach begin="0" end="90" varStatus="status">
							    	<tr>
								        <td>${ status.index + 1}</td>
								        <td>Escort</td>
								        <td>2000</td>
								    </tr>
						    	</c:forEach>
						    </tbody>
						    <tfoot>
						    	<tr>
						    		<td id="cost">SUM</td>
						    	</tr>
						    </tfoot>
					</table>
				</div>	
			</div>
			
		</div>
	
		<c:import url="/include/jsLoad.jsp"></c:import>
		 <!-- Initialize Swiper -->
	    <script>
		    var swiper = new Swiper('.swiper-container', {
		        pagination: '.swiper-pagination',
		        paginationClickable: false
		    });
		    
		    $(".swiper-slide").click(function() {
		    	$("#cost").text("asdf");
		    });
	    </script>
	</body>
</html>