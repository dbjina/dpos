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
				<div class="col-xs-12 col-sm-3">
					<table class="table table-striped table-header-fixed">
						  <thead>
							    <tr>
							        <th>Make</th>
							        <th>Model</th>
							        <th>Color</th>
							        <th>Year</th>
							    </tr>
						    </thead>
						    <tbody>
							    <tr>
							        <td class="filterable-cell">Ford</td>
							        <td class="filterable-cell">Escort</td>
							        <td class="filterable-cell">Blue</td>
							        <td class="filterable-cell">2000</td>
							    </tr>
							    <tr>
							        <td class="filterable-cell">Ford</td>
							        <td class="filterable-cell">Escort</td>
							        <td class="filterable-cell">Blue</td>
							        <td class="filterable-cell">2000</td>
							    </tr>
							            <tr>
							        <td class="filterable-cell">Ford</td>
							        <td class="filterable-cell">Escort</td>
							        <td class="filterable-cell">Blue</td>
							        <td class="filterable-cell">2000</td>
							    </tr>
							     <tr>
							        <td class="filterable-cell">Ford</td>
							        <td class="filterable-cell">Escort</td>
							        <td class="filterable-cell">Blue</td>
							        <td class="filterable-cell">2000</td>
							    </tr>
							    <tr>
							        <td class="filterable-cell">Ford</td>
							        <td class="filterable-cell">Escort</td>
							        <td class="filterable-cell">Blue</td>
							        <td class="filterable-cell">2000</td>
							    </tr>
							    <tr>
							        <td class="filterable-cell">Ford</td>
							        <td class="filterable-cell">Escort</td>
							        <td class="filterable-cell">Blue</td>
							        <td class="filterable-cell">2000</td>
							    </tr>
							    <tr>
							        <td class="filterable-cell">Ford</td>
							        <td class="filterable-cell">Escort</td>
							        <td class="filterable-cell">Blue</td>
							        <td class="filterable-cell">2000</td>
							    </tr>
							    <tr>
							        <td class="filterable-cell">Ford</td>
							        <td class="filterable-cell">Escort</td>
							        <td class="filterable-cell">Blue</td>
							        <td class="filterable-cell">2000</td>
							    </tr>
							    <tr>
							        <td class="filterable-cell">Ford</td>
							        <td class="filterable-cell">Escort</td>
							        <td class="filterable-cell">Blue</td>
							        <td class="filterable-cell">2000</td>
							    </tr>
							    <tr>
							        <td class="filterable-cell">Ford</td>
							        <td class="filterable-cell">Escort</td>
							        <td class="filterable-cell">Blue</td>
							        <td class="filterable-cell">2000</td>
							    </tr>
							    <tr>
							        <td class="filterable-cell">Ford</td>
							        <td class="filterable-cell">Escort</td>
							        <td class="filterable-cell">Blue</td>
							        <td class="filterable-cell">2000</td>
							    </tr>
						    </tbody>
					</table>
				</div>	
			</div>
			
		</div>
		<!-- 
		<div class="container-fluid">
			Menu start
			<div class="row">
				Parent category start
				<div class="col-md-2 col-sm-12 text-center">
					<div class="row">
						<div class="col-xs-3 col-sm-3 col-md-12 ">
							<button class="btn btn-default btn-lg"><span class="glyphicon glyphicon-arrow-up" aria-hidden="true"></span></button>
						</div>
						<div class="col-xs-3 col-sm-3 col-md-12">
							<button class="btn btn-default btn-lg">큰분류1</button>
						</div>
						<div class="col-xs-3 col-sm-3 col-md-12">
							<button class="btn btn-default btn-lg">큰분류1</button>
						</div>
						<div class="col-xs-3 col-sm-3 col-md-12">
							<button class="btn btn-default btn-lg">큰분류1</button>
						</div>
					</div>
				</div>	Parent category end
			</div>
			<div class="row">
				Child category start
				<div class="col-md-9 col-sm-12">
					<div class="row">
						<div class="col-md-2">
							<button class="btn btn-default btn-lg">메뉴</button>
						</div>
						<div class="col-md-2">
							<button class="btn btn-default btn-lg">메뉴</button>
						</div>
						<div class="col-md-2">
							<button class="btn btn-default btn-lg">메뉴</button>
						</div>
						<div class="col-md-2">
							<button class="btn btn-default btn-lg">메뉴</button>
						</div>
						<div class="col-md-2">
							<button class="btn btn-default btn-lg">메뉴</button>
						</div>
					</div>
				</div>	Child category end
				Ordered list start
				<div class="col-md-1 col-sm-12">
					<div class="row">
						목록
					</div>
				</div>	Ordered list end
			</div>
		</div>	Menu end
		 -->
	
		<c:import url="/include/jsLoad.jsp"></c:import>
		 <!-- Initialize Swiper -->
	    <script>
	    var swiper = new Swiper('.swiper-container', {
	        pagination: '.swiper-pagination',
	        paginationClickable: false
	    });
	    </script>
	</body>
</html>