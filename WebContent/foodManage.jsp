<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<c:import url="/include/meta.html"></c:import>
		<title>${ initParam.BRAND }</title>
		<c:import url="/include/cssLoad.jsp"></c:import>
	</head>
	<body>
		<c:import url="/include/adminNav.jsp"></c:import>
		
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4">
					<div class="row table-foodMenu table-list">
						<form method="post" id="menuForm">
							<table class="table" id="menuTable">
								<thead>
									<tr>
										<th class="hidden">Menu Seq</th>
										<th>Name</th>
										<th>Type</th>
									</tr>
								</thead>
								<tbody>
									<c:set var="old" value="0" scope="page"/>
									<c:forEach var="menu" items="${ listMenu }">
										<c:if test="${ old ne menu.menu_seq }">
											<c:set var="old" value="${ menu.menu_seq }" scope="page" />
											<tr>
												<td class="hidden">${ menu.menu_seq }</td>
												<td>${ menu.menu_name }</td>
												<td>${ menu.menu_type }</td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>	
							</table>		
						</form>
					</div>
				</div>
				<div class="col-md-8">
					<div class="row table-foodMenu-detail table-list">
						<table class="table" id="menuTableDetail">
							<thead>
								<tr>
									<th class="hidden">Menu Price Seq</th>
									<th>Price</th>
									<th>Day</th>
									<th>Size</th>
								</tr>
							</thead>
							<tbody>
							</tbody>	
						</table>		
					</div>
				</div>
			</div>
			<div class="row text-center">
				<!-- Swiper -->
				<div class="swiper-container swiper-function-pad">
				    <div class="swiper-wrapper dpos-function-pad">
				    		<div class="col-md-2 col-md-offset-3">
						    	<button class="btn btn-default btn-block" onclick="del()">Delete</button>
				    		</div>
				    		<div class="col-md-2">
								<button class="btn btn-default btn-block disabled">Modify</button>
				    		</div>
				    		<div class="col-md-2">
								<button class="btn btn-default btn-block disabled">Register</button>
				    		</div>
				    </div>
				    <!-- Add Pagination -->
				    <div class="swiper-pagination"></div>
				</div> <!-- End Swiper -->
			</div>
		</div>
		
		<c:import url="/include/jsLoad.jsp"></c:import>
		<script type="text/javascript">
			$(function() {
				function JoinedMenu() {
					this.menu_seq;
					this.menu_price_seq;
					this.menu_price;
					this.menu_price_group_name;
					this.menu_size;
				};
				
				JoinedMenu.prototype.getMenu_seq = function() { return this.menu_seq; };
				JoinedMenu.prototype.getMenu_price_seq = function() { return this.menu_price_seq; };
				JoinedMenu.prototype.getMenu_price = function() { return this.menu_price; };
				JoinedMenu.prototype.getMenu_price_group_name = function() { return this.menu_price_group_name; };
				JoinedMenu.prototype.getMenu_size = function() { return this.menu_size; };
				
				var menus = new Array();
				
				var joinedMenu = null;
				
				<c:forEach var="menu" items="${ listMenu }">
					joinedMenu = new JoinedMenu();
					joinedMenu.menu_seq = ${ menu.menu_seq };
					joinedMenu.menu_price_seq = ${ menu.menu_price_seq };
					joinedMenu.menu_price = ${ menu.menu_price };
					joinedMenu.menu_price_group_name = "${ menu['menu_price_group_name'] }";
					joinedMenu.menu_size = "${ menu.menu_size }";
					menus.push(joinedMenu);
				</c:forEach>
				
				$("#menuTable").find("tbody").find("tr").on('click', function() {
					if($(this).hasClass("bg-danger")) {
						$(this).removeClass("bg-danger");
					}
					else {
						$("#menuTable").find("tbody").find("tr").each(function() {
							$(this).removeClass("bg-danger");
						});
						$(this).addClass("bg-danger");
						
						$("#menuTableDetail").find("tbody").text("");
						
						var m_seq = $(this).find("td:first-child").text();
						
						var str = "";
						for(var i = 0; i<menus.length; i++) {
							if(menus[i].getMenu_seq() == m_seq) {
								str = "<tr>"
										+ "<td class='hidden'>"
											+ menus[i].getMenu_price_seq()
										+ "</td>"
										+ "<td>"
											+ menus[i].getMenu_price()
										+ "</td>"
										+ "<td>"
											+ menus[i].getMenu_price_group_name()
										+  "</td>"
										+ "<td>"
											+ menus[i].getMenu_size()
										+  "</td>"
										
									+"</tr>";
								
								$("#menuTableDetail").find("tbody").append(str);
							}	
						}
						makeTableHightlightByClick($("#menuTableDetail"), "bg-primary");
					}
				});
				
				/* Initialize Swiper the function pad*/
				var swiperFunctionpad = new Swiper('.swiper-function-pad', {
			        pagination: '.swiper-pagination',
			        paginationClickable: false,
			        grabCursor: true,
			    });
				
				
			});
			
			function del() {
				if($("#menuTableDetail").find("tbody").find("tr").hasClass("bg-primary") == true) {
					deleteItem($("#menuTableDetail"), "bg-primary", 1, 2, $("#menuForm"), "menu_price_seq", "${ rootPath }/Manage/FoodManage/DeleteFoodPrice.do");
				}
				else if($("#menuTable").find("tbody").find("tr").hasClass("bg-danger") == false){
					alert("Please click at least one item on the table");
				}
				else {
					deleteItem($("#menuTable"), "bg-danger", 1, 2, $("#menuForm"), "menu_seq", "${ rootPath }/Manage/FoodManage/DeleteFood.do");
				}
			}
			
		</script>
	</body>
</html>