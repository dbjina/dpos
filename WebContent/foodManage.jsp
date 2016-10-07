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
			<div class="row table-foodMenu table-list">
				<form method="post" id="supForm">
				<table class="table" id="supTable">
					<thead>
						<tr>
							<th class="hidden">Seq</th>
							<th>Name</th>
							<th>Description</th>
							<th>Recipe</th>
							<th class="hidden">Type Seq</th>
							<th>Type</th>
							<th>Price</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="menu" items="${ listMenu }">
								<tr>
									<td class="hidden">${ menu.menu_seq }</td>
									<td>${ menu.menu_name } (${ menu.menu_size })</td>
									<td>
										<c:choose>
											<c:when test="${ menu.menu_description.length() gt 10 }">
												<span class="hidden">${ menu.menu_description }</span>
												${ fn:substring(menu.menu_description, 0, 10) }...
											</c:when>
											<c:otherwise>
												${ menu.menu_description }
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${ menu.menu_recipe.length() gt 10 }">
												<span class="hidden">${ menu.menu_recipe }</span>
												${ fn:substring(menu.menu_recipe, 0, 10) }...
											</c:when>
											<c:otherwise>
												${ menu.menu_recipe }
											</c:otherwise>
										</c:choose>
									</td>
									<td class="hidden">${ menu.menu_type_seq }</td>
									<td>${ menu.menu_type }</td>
									<td>${ menu.menu_price }</td>
								</tr>
						</c:forEach>
					</tbody>	
				</table>		
				</form>
			</div>
			<div class="row functions">
				<div class="swiper-container">
				    <div class="swiper-wrapper text-center">
				        <div class="swiper-slide">
				        	<button class="btn btn-default btn-lg" onclick="deleteSup()">Delete</button>
				        	<button class="btn btn-default btn-lg" id="btnModify" onclick="modifySup()">Modify</button>
				        	<button class="btn btn-default btn-lg">Register</button>
				        </div>
				    </div>
				    <!-- Add Pagination -->
				    <!-- <div class="swiper-pagination"></div> -->
				</div> <!-- End Swiper -->
			</div>
		</div>
		
		<c:import url="/include/jsLoad.jsp"></c:import>
		<script type="text/javascript">
			$(function() {
				$(".table-list").find("tbody").find("tr").mouseup(function() {
					if($(this).hasClass("bg-danger")) {
						$(this).removeClass("bg-danger");
					}
					else {
						$(this).addClass("bg-danger");
					}
				});
			});
		</script>
	</body>
</html>